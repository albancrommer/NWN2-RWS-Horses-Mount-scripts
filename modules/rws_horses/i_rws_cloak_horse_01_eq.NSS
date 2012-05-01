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
	
	SendMessageToPC( oPC, "You cannot equip that. This item should not be in inventory, please report." );
	object oItemInSlot 	= GetItemInSlot( INVENTORY_SLOT_CLOAK, oPC );
	if( OBJECT_INVALID != oItemInSlot )
	{
		AssignCommand( oPC, ActionUnequipItem( oItemInSlot ) );
	}
	DestroyObject( oItemInSlot, 0.01f);
	
	
}