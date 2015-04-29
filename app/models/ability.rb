class Ability
  include CanCan::Ability

  def initialize(user)
      	if user.gsmp?
      		can :manage, :all

        elsif user.director?
          can :index, :all

        elsif user.acquisition?
          can :create, :all 
          can :index, :all
          can :update, :all

        elsif user.acquisition_analist?
          can :create, :all
          can :index, :all

        elsif user.import?
          can :create, :all
          can :index, :all

        elsif user.import_analist?
          can :create, :all
          can :index, :all

        elsif user.manage?
          can :index, :all
          
        elsif user.manage_analist?
          can :index, :all
        
        elsif user.quality?
          can :index, :all

        elsif user.quality_analist?
          can :index, :all

        elsif user.directorate?
          can :index, :all
        
        elsif user.external?
          can :index, :all
        
        elsif user.section_boss?
          can :index, :all
          can :update, :all
        
        elsif user.labassistant?
          can :index, :all
          can :update, :all

        elsif user.proy_responsible?
          can :index, :all
          can :update, :all
        
          
          
          
      	elsif user.labBoss?
      		can :index, :all
      		
      	elsif user.technician?
      		can :index, :all
      	else  
      		can :index, :all  
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
    # The first argument to `can` is the action you are giving the user 
    # permission to do.
    # If you pass :manage it will apply to every action. Other common actions
    # here are :read, :create, :update and :destroy.
    #
    # The second argument is the resource the user can perform the action on. 
    # If you pass :all it will apply to every resource. Otherwise pass a Ruby
    # class of the resource.
    #
    # The third argument is an optional hash of conditions to further filter the
    # objects.
    # For example, here the user can only update published articles.
    #
    #   can :update, Article, :published => true
    #
    # See the wiki for details:
    # https://github.com/ryanb/cancan/wiki/Defining-Abilities
  end
end
