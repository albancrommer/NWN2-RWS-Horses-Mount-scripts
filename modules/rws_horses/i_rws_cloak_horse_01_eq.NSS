// i_rws_*cloak*_eq
/*
   
	Disallows equip out of context
	
*/
// 120123 Alban
#include "inc_rws_horses"

void main()
{

    // * This code runs when the item is equipped
    object oPC      = GetPCItemLastEquippedBy();
    object oItem    = GetPCItemLastEquipped();

	if( GetIsMountAllowed( oPC ) )
	{
		return;
	}
	
	SendMessageToPC( oPC, MSG_RWS_MOUNT_INVALID_EQUIP );
	
	// You could alert DMs or PW admins here
	
	object oItemInSlot 	= GetItemInSlot( INVENTORY_SLOT_CLOAK, oPC );
	if( OBJECT_INVALID != oItemInSlot )
	{
		AssignCommand( oPC, ActionUnequipItem( oItemInSlot ) );
	}
	DestroyObject( oItemInSlot, 0.01f);
	
	
}