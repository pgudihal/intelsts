# The ability.rb file controls the user permissions. In this file, we have defined what a staff,
# admin, or just evaluator can do

class Ability
  include CanCan::Ability

  def initialize(user)

#Admins can do anything
    if user.admin?
        can :manage, :all
    else
     
#Staff members can do anything as well   
    if user.staff?
        can :manage, :all
    else

#Evaluators can edit user information for themselves
      can :edit, User do |u|
      u.id == user.id
      end

#Evaluators can read user information for themselves
      can :read, User do |u|
      u.id == user.id
      end

#Evaluators can update user information for themselves
      can :update, User do |u|
        u.id == user.id
      end

#Evaluators can read evaluator information for themselves
      can :read, Evaluator do |e|
      e.user_id == user.id
      end
      
#Evaluators can edit evaluator information for themselves
      can :edit, Evaluator do |e|
      e.user_id == user.id
      end
      
      
#Evaluators can update evaluator information for themselves
      can :update, Evaluator do |e|
        e.user_id == user.id
      end

#Evaluators cannot destroy users or evaluators from the system     
      cannot :destroy, User
      cannot :destroy, Evaluator
      
#Evaluators cannot create, update, or destroy Assignments
      cannot :create, Assignment
      cannot :update, Assignment
      cannot :destroy, Assignment
      
#Evaluators cannot create, update, edit, or destroy Applications
      cannot :create, Application
      cannot :update, Application
      cannot :edit, Application
      cannot :destroy, Application

#Evaluators can read Assignments they have been assigned to
      can :read, Assignment do |a|
        !Assignment.find(:all, :conditions => {:evaluator_id => user.id, :application_id => a.application_id}).empty?
      end

#Evaluators can edit Assignments they have been assigned to
      can :edit, Assignment do |a|
      Evaluator.find(a.evaluator_id).user_id == user.id
      end

#Evaluators can only read Applications who they have been assigned to through Assignments
      can :read, Application do |a|
      !Assignment.find(:all, :conditions => {:evaluator_id => user.id, :application_id => a.id}).empty?
      end        

    end
  end
  end
  end
  
    # Define abilities for the passed in user here. For example:
    #
    #   user ||= User.new # guest user (not logged in)
    #   if user.admin?
    #     can :manage, :all
    #   else
    #     can :read, :all
    #   end
    #
    # The first argument to `can` is the action you are giving the user permission to do.
    # If you pass :manage it will apply to every action. Other common actions here are
    # :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. If you pass
    # :all it will apply to every resource. Otherwise pass a Ruby class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details: https://github.com/ryanb/cancan/wiki/Defining-Abilities
    #
    