// i_rws_cloak_**_ue
/*
   
	Disallows unequip out of context
	
*/
// 120123 Alban
#include "inc_rws_horses"

void main()
{
	PrettyDebug("Unequiping");
    // * This code runs when the item is unequipped
    object oCreature	= GetPCItemLastUnequippedBy();
    object oItem    	= GetPCItemLastUnequipped();
	if( GetIsUnmountAllowed( oCreature ) )
	{	
		return;
	}
	
	SendMessageToPC( oCreature, MSG_RWS_MOUNT_INVALID_UNEQUIP"You cannot unmount like that, please use the Unique Power of the mounting item by targeting it on yourself" );
	object oItemInSlot 	= GetItemInSlot( INVENTORY_SLOT_CLOAK, oCreature );
	if( OBJECT_INVALID != oItemInSlot )
	{
		AssignCommand( oCreature, ActionUnequipItem( oItemInSlot ) );
	}
	AllowMount( oCreature );
	AssignCommand( oCreature, ActionEquipItem( oItem, INVENTORY_SLOT_CLOAK ) );
	DelayCommand( DELAY_MOUNT_DISALLOW, DisallowMount( oCreature ) );
	
}