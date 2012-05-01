// i_rws_saddle_ac
/*
   Activate item script for the RWS saddle item
   This script will run each time saddle's "custom activation" is used.
   
*/
// 120123 Alban 

#include "inc_rws_horses"

void main()
{

    object oPC      	= GetItemActivator();
    object oItem    	= GetItemActivated();
    object oTarget  	= GetItemActivatedTarget();
    location lTarget 	= GetItemActivatedTargetLocation();

	// Unmounting
	if( GetIsMounted( oPC ) )
	{
		if( oPC == oTarget )
		{
			Unmount(oPC);
			return;
		}
		if( GetIsLocationValid( lTarget ) )
		{
			if( GetDistanceBetweenLocations( lTarget, GetLocation(oPC) ) < DISTANCE_MOUNTABLE ){
				Unmount(oPC);
				return;
			}
			// Must be close
			SendMessageToPC( oPC, MSG_RWS_MOUNT_INVALID_UNMOUNT_DISTANCE );
			return;
		}
		
		// Must target self or place 	
		SendMessageToPC( oPC, MSG_RWS_MOUNT_INVALID_UNMOUNT );

	// Mounting
	}else{
	
		// Must target a valid animal
		if( !GetIsValidMount( oTarget, oPC )  )
		{
			SendMessageToPC( oPC, MSG_RWS_MOUNT_INVALID_MOUNT );
			return;
		}
		// Must be close
		if( GetDistanceBetween( oTarget, oPC ) > DISTANCE_MOUNTABLE ){
			SendMessageToPC( oPC, MSG_RWS_MOUNT_INVALID_MOUNT_DISTANCE );
			return;
		}
		Mount(oPC, oTarget);	
	}
}