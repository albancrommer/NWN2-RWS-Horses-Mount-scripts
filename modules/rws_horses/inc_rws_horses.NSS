#include "ginc_debug" 
#include "inc_const" 

// Prototypes
void AllowMount( object oCreature );
void AllowUnmount( object oCreature );
void DisallowMount( object oCreature );
void DisallowUnmount( object oCreature );
string GetCreatureAnimalVar( object oCreature );
string GetCreatureAppearanceVar( object oCreature );
string GetCreatureInventoryVar( object oCreature );
int GetIsMounted( object oCreature );
int GetIsMountAllowed( object oCreature );
int GetIsUnmountAllowed( object oCreature );
int GetIsValidMount( object oAnimal, object oCreature );
string GetMountItemTag( object oAnimal );
int Mount( object oCreature, object oAnimal );
void SetIsMounted( object oCreature, int nStatus = TRUE );
int SetMountedAnimal( object oCreature, object oAnimal );
int SetMountedAppearance( object oCreature, object oAnimal );
int SetMountedInventory( object oCreature, object oAnimal );
object SetUnmountedAnimal(object oCreature );
int SetUnmountedAppearance(object oCreature );
int SetUnmountedInventory(object oCreature );
int Unmount( object oCreature );
void UnsetCreatureAnimalVar( object oCreature );
void UnsetCreatureAppearanceVar( object oCreature );
void UnsetCreatureInventoryVar( object oCreature );



// *******************************************************************
// User editable functions : adapt to your needs
// *******************************************************************

// Returns the right appearance.2DA line
int GetMountedAppearanceLine(object oCreature){

 int nAppearance = GetAppearanceType(oCreature);
 int nReturn = -1;
  switch(nAppearance){
  
  case 6: nReturn = MOUNT_6_HUMAN; break;// HUMAN
   case 3: nReturn = MOUNT_3_HALFLING; break;// HALFLING
   case 4: nReturn = MOUNT_4_HALF_ELF; break;// HALF_ELF
   case 1: nReturn = MOUNT_1_ELF; break;// ELF
   case 0: nReturn = MOUNT_0_DWARF; break;// DWARF
   case 2: nReturn = MOUNT_2_GNOME; break;// GNOME
   case 5: nReturn = MOUNT_5_HALF_ORC; break;// HALF_ORC
   case 26: nReturn = MOUNT_26_PLANETAR; break;// PLANETAR
   case 39: nReturn = MOUNT_39_LICH; break;// LICH
   case 40: nReturn = MOUNT_40_YUANTI_PUREBLOOD; break;// YUANTI_PUREBLOOD
   case 47: nReturn = MOUNT_47_NPC_SASANI_NX2; break;// NPC_SASANI_NX2
   case 48: nReturn = MOUNT_48_NPC_VOLO_NX2; break;// NPC_VOLO_NX2
   case 50: nReturn = MOUNT_50_NPC_SEPTIMUND_NX2; break;// NPC_SEPTIMUND_NX2
   case 51: nReturn = MOUNT_51_DRYAD; break;// DRYAD
   case 288: nReturn = MOUNT_288_VAMPIRE_FEMALE_MALE; break;// VAMPIRE_FEMALE_MALE
   case 483: nReturn = MOUNT_483_GITHYANKI; break;// GITHYANKI
   case 514: nReturn = MOUNT_514_DEVIL_ERINYES; break;// DEVIL_ERINYES
   case 537: nReturn = MOUNT_537_SKELETON; break;// SKELETON
   case 544: nReturn = MOUNT_544_NPC_GARIUS; break;// NPC_GARIUS
   case 549: nReturn = MOUNT_549_NPC_DUNCAN; break;// NPC_DUNCAN
   case 550: nReturn = MOUNT_550_NPC_LORDNASHER; break;// NPC_LORDNASHER
   case 563: nReturn = MOUNT_563_ASSIMAR; break;// ASSIMAR
   case 564: nReturn = MOUNT_564_TIEFLING; break;// TIEFLING
   case 565: nReturn = MOUNT_565_ELF_SUN; break;// ELF_SUN
   case 566: nReturn = MOUNT_566_ELF_WOOD; break;// ELF_WOOD
   case 567: nReturn = MOUNT_567_ELF_DROW; break;// ELF_DROW
   case 571: nReturn = MOUNT_571_HALFLING_STRONGHEART; break;// HALFLING_STRONGHEART
   case 579: nReturn = MOUNT_579_NPC_GITHCAPTAIN; break;// NPC_GITHCAPTAIN
   case 580: nReturn = MOUNT_580_NPC_LORNE; break;// NPC_LORNE
   case 581: nReturn = MOUNT_581_NPC_TENAVROK; break;// NPC_TENAVROK
   case 582: nReturn = MOUNT_582_NPC_CTANN; break;// NPC_CTANN
   case 583: nReturn = MOUNT_583_NPC_SHANDRA; break;// NPC_SHANDRA
   case 584: nReturn = MOUNT_584_NPC_ZEEAIRE; break;// NPC_ZEEAIRE
   case 585: nReturn = MOUNT_585_NPC_ZEEAIRES_LIEUTENANT; break;// NPC_ZEEAIRES_LIEUTENANT
   case 588: nReturn = MOUNT_588_NPC_ZHJAEVE; break;// NPC_ZHJAEVE
   case 590: nReturn = MOUNT_590_NPC_AHJA; break;// NPC_AHJA
   case 592: nReturn = MOUNT_592_NPC_HEZEBEL; break;// NPC_HEZEBEL
   case 594: nReturn = MOUNT_594_NPC_ZOKAN; break;// NPC_ZOKAN
   case 595: nReturn = MOUNT_595_NPC_ALDANON; break;// NPC_ALDANON
   case 596: nReturn = MOUNT_596_NPC_JACOBY; break;// NPC_JACOBY
   case 597: nReturn = MOUNT_597_NPC_JALBOUN; break;// NPC_JALBOUN
   case 598: nReturn = MOUNT_598_NPC_KHRALVER; break;// NPC_KHRALVER
   case 599: nReturn = MOUNT_599_NPC_KRALWOK; break;// NPC_KRALWOK
   case 600: nReturn = MOUNT_600_NPC_MEPHASM; break;// NPC_MEPHASM
   case 601: nReturn = MOUNT_601_NPC_MORKAI; break;// NPC_MORKAI
   case 602: nReturn = MOUNT_602_NPC_SARYA; break;// NPC_SARYA
   case 603: nReturn = MOUNT_603_NPC_SYDNEY; break;// NPC_SYDNEY
   case 604: nReturn = MOUNT_604_NPC_TORIOCLAVEN; break;// NPC_TORIOCLAVEN
   case 606: nReturn = MOUNT_606_NPC_SHADOWPRIEST; break;// NPC_SHADOWPRIEST
   case 1000: nReturn = MOUNT_1000_AKACHI_NX1; break;// AKACHI_NX1
   case 1007: nReturn = MOUNT_1007_RED_WIZ_COMPANION_NX1; break;// RED_WIZ_COMPANION_NX1
   case 1008: nReturn = MOUNT_1008_DEATH_KNIGHT_NX1; break;// DEATH_KNIGHT_NX1
   case 1013: nReturn = MOUNT_1013_SOLAR_NX1; break;// SOLAR_NX1
   case 1034: nReturn = MOUNT_1034_MAGDA_NX1; break;// MAGDA_NX1
   case 1035: nReturn = MOUNT_1035_NEFRIS_NX1; break;// NEFRIS_NX1
   case 1036: nReturn = MOUNT_1036_ELF_WILD_NX1; break;// ELF_WILD_NX1
   case 1037: nReturn = MOUNT_1037_EARTH_GENASI_NX1; break;// EARTH_GENASI_NX1
   case 1038: nReturn = MOUNT_1038_FIRE_GENASI_NX1; break;// FIRE_GENASI_NX1
   case 1039: nReturn = MOUNT_1039_AIR_GENASI_NX1; break;// AIR_GENASI_NX1
   case 1040: nReturn = MOUNT_1040_WATER_GENASI_NX1; break;// WATER_GENASI_NX1
   case 1041: nReturn = MOUNT_1041_HALF_DROW_NX1; break;// HALF_DROW_NX1
   case 1046: nReturn = MOUNT_1046_NPC_ORBAKH; break;// NPC_ORBAKH
   case 1204: nReturn = MOUNT_1204_YUANTIF_REE; break;// YUANTIF_REE
   case 1205: nReturn = MOUNT_1205_TELETUBBIE; break;// TELETUBBIE
   case 1220: nReturn = MOUNT_1220_NPC_LEXI_REE; break;// NPC_LEXI_REE
   case 1221: nReturn = MOUNT_1221_NPC_SIMZA_REE; break;// NPC_SIMZA_REE
   case 1299: nReturn = MOUNT_1299_REE_RENYIL; break;// REE_RENYIL
   case 569: nReturn = MOUNT_569_DWARFGOLD; break;// DWARFGOLD
   case 570: nReturn = MOUNT_570_DWARFDUERGAR; break;// DWARFDUERGAR
   case 45: nReturn = MOUNT_45_GRAYORC; break;// GRAYORC
   default: nReturn = -1;
  }
 if( -1 == nReturn ){
 	PrettyDebug( "ReturnAppearanceLine failed to identify Appearance#"+IntToString( nAppearance ) );
 	return -1;
 }	

 return nReturn;
}


// Checks against whatever rule you define as valid for your mounted creature
// ex : require poney for dwarfs and gnomes, etc.
// For now, let's simply check the tag value
int GetIsValidMount( object oAnimal, object oCreature )
{
	string sTag = GetTag( oAnimal );
	if( "c_horse" != sTag )
	{
		return FALSE;
	}
	return TRUE;
}

// returns the adequate item tag for a given animal object
// ex: You will want to match "c_horse_dark" with "cloak_dark_horse" 
string GetMountItemTag( object oAnimal )
{
	string sTag 	= GetTag( oAnimal);
	if( "c_horse" 	== sTag){ return "rws_cloak_horse_01"; }
	return "";
}



// *******************************************************************
// System functions : edit at your own risk
// *******************************************************************


// Deals with the mounted animal : saves for reference
int SetMountedAnimal( object oCreature, object oAnimal )
{
	PrettyDebug( "SetMountedAnimal fires ");

	SetLocalObject( GetModule(), GetCreatureAnimalVar( oCreature ), oAnimal );
	SetScriptHidden( oAnimal, TRUE );
	return TRUE;

}


// Deals mounting inventory : saves for reference and places cloak
int SetMountedInventory( object oCreature, object oAnimal )
{
	PrettyDebug( "SetMountedInventory fires ");

	object oItemInSlot 	= GetItemInSlot( INVENTORY_SLOT_CLOAK, oCreature );
	if( GetIsObjectValid( oItemInSlot ) )
	{
		SetLocalObject( GetModule(), GetCreatureInventoryVar(oCreature), oItemInSlot );
		AssignCommand( oCreature, ActionUnequipItem( oItemInSlot ) );
	
	}else{
		DeleteLocalObject( GetModule(), GetCreatureInventoryVar( oCreature) );
	}
	PrettyDebug( "GetMountItemTag returns "+GetMountItemTag( oAnimal ) );
	object oMountItem = CreateItemOnObject( GetMountItemTag( oAnimal ), oCreature );
	AllowMount( oCreature );
	AssignCommand( oCreature, ActionEquipItem( oMountItem, INVENTORY_SLOT_CLOAK ) );
	DelayCommand( DELAY_MOUNT_DISALLOW, DisallowMount( oCreature ) );
	return TRUE;

}

// Deals with the mounting : changes actual appearance
int SetMountedAppearance( object oCreature, object oAnimal )
{
	PrettyDebug( "SetMountedAppearance fires ");

	int nOriginalAppearance = GetAppearanceType(oCreature);
	int nMountedAppearance = GetMountedAppearanceLine(oCreature);
	if (nMountedAppearance == -1)
	{
		SendMessageToPC(oCreature, "Your racial appearance is not recognized. Abort Mounted Horse appearance change.");
		return FALSE;
	}
	SetLocalInt( oCreature, GetCreatureAppearanceVar( oCreature ), nOriginalAppearance);	
	SetCreatureAppearanceType(oCreature, nMountedAppearance);
	return TRUE;
}



// Encapsulates mounting appearance, inventory and animal routines
int Mount( object oCreature, object oAnimal )
{
	if( !SetMountedAnimal( oCreature, oAnimal ) )
	{
		PrettyDebug( "Mount::SetMountedAnimal failed");
		return FALSE;
	}
	if( !SetMountedInventory(  oCreature, oAnimal ) )
	{
		PrettyDebug( "Mount::SetMountedInventory failed");
		Unmount( oCreature );
		return FALSE;
	}
	if( !SetMountedAppearance(  oCreature, oAnimal ) )
	{
		PrettyDebug( "Mount::SetMountedAppearance failed");
		Unmount( oCreature );
		return FALSE;
	}
	SetIsMounted( oCreature, TRUE );
	return TRUE;
	
}

// Deals with unmounting animal : respawns it and deletes variable
object SetUnmountedAnimal(object oCreature )
{
	PrettyDebug( "SetUnmountedAnimal fires ");
	object oAnimal;
	oAnimal = GetLocalObject( GetModule(), GetCreatureAnimalVar( oCreature ) );
	if( !GetIsObjectValid( oAnimal ) )
	{
		PrettyDebug( "SetUnmountedAnimal::couldn't find original animal ");
		return OBJECT_INVALID;
	}
	
	AssignCommand( oAnimal, ActionJumpToObject( oCreature ) );
	SetScriptHidden( oAnimal, FALSE );
	UnsetCreatureAppearanceVar( oCreature );
	return oAnimal;
}


// Deals with unmounting inventory
int SetUnmountedInventory(object oCreature )
{
	PrettyDebug( "SetUnmountedInventory fires ");

	object oMountItem = GetItemInSlot( INVENTORY_SLOT_CLOAK, oCreature );
	AllowUnmount( oCreature );
	AssignCommand( oCreature, ActionUnequipItem( oMountItem ) );
	DisallowUnmount( oCreature );
	DestroyObject( oMountItem );
	object oOriginalCloakItem = GetLocalObject( GetModule(), GetCreatureInventoryVar( oCreature ));
	if( GetIsObjectValid( oOriginalCloakItem ) )
	{
		AssignCommand( oCreature, ActionEquipItem( oOriginalCloakItem, INVENTORY_SLOT_CLOAK ) );
		UnsetCreatureInventoryVar( oCreature );
	}
	return TRUE;
}


// Deals with unmounting appearance
int SetUnmountedAppearance(object oCreature )
{
	PrettyDebug( "SetUnmountedAppearance fires ");
	int nOriginalAppearance = GetLocalInt(oCreature, GetCreatureAppearanceVar( oCreature ) );
	SetCreatureAppearanceType(oCreature, nOriginalAppearance);
	UnsetCreatureAppearanceVar(oCreature );
	return TRUE;
}

/* Encapsulates Animal, Inventory, Appearance for Unmounting */
int Unmount( object oCreature )
{
	object oAnimal = SetUnmountedAnimal( oCreature);
	if( !GetIsObjectValid( oAnimal) )
	{
		PrettyDebug( "Mount::SetUnmountedAnimal failed");
		return FALSE;
	}
	if( !SetUnmountedInventory(  oCreature) )
	{
		PrettyDebug( "Mount::SetUnmountedInventory failed");
		Mount( oCreature, oAnimal  );
		return FALSE;
	}
	if( !SetUnmountedAppearance(  oCreature ) )
	{
		PrettyDebug( "Mount::SetUnmountedAppearance failed");
		Mount( oCreature, oAnimal  );
		return FALSE;
	}
	SetIsMounted( oCreature, FALSE );
	return TRUE;
	

}

// *******************************************************************
// Accessors and utilities
// *******************************************************************

// Simple unlocker 
void AllowMount( object oCreature )
{
	SetLocalInt( oCreature, VAR_PC_ALLOW_MOUNT, TRUE );
PrettyDebug( "AllowMount : "+IntToString( GetLocalInt( oCreature, VAR_PC_ALLOW_MOUNT) ) );
}

// Simple locker 
void DisallowMount( object oCreature )
{
	SetLocalInt( oCreature, VAR_PC_ALLOW_MOUNT, FALSE );
PrettyDebug( "DisallowMount : "+IntToString( GetLocalInt( oCreature, VAR_PC_ALLOW_MOUNT) ) );
}


// Simple variable accessor : true if mounted was set
int GetIsMountAllowed( object oCreature )
{
PrettyDebug( "GetIsMountAllowed : "+IntToString( GetLocalInt( oCreature, VAR_PC_ALLOW_MOUNT) ) );
	return GetLocalInt( oCreature, VAR_PC_ALLOW_MOUNT);
}

// Simple unlocker 
void AllowUnmount( object oCreature )
{
	SetLocalInt( oCreature, VAR_PC_ALLOW_UNMOUNT, TRUE );
}

// Simple locker 
void DisallowUnmount( object oCreature )
{
	SetLocalInt( oCreature, VAR_PC_ALLOW_UNMOUNT, FALSE );
}


// Simple variable accessor : true if mounted was set
int GetIsUnmountAllowed( object oCreature )
{
	return GetLocalInt( oCreature, VAR_PC_ALLOW_UNMOUNT);
}


// Simple variable accessor : true if mounted was set
int GetIsMounted( object oCreature )
{
	PrettyDebug( "GetIsMounted: "+IntToString( GetLocalInt( oCreature, VAR_PC_IS_MOUNTED ) ) );
	return GetLocalInt( oCreature, VAR_PC_IS_MOUNTED);
}


// Simple variable accessor : sets mounted status
void SetIsMounted( object oCreature, int nStatus = TRUE )
{
	PrettyDebug( "SetIsMounted: "+IntToString( nStatus ) );
	SetLocalInt( oCreature, VAR_PC_IS_MOUNTED, nStatus );
}


// returns CONCAT( VAR_MODULE_ORIGINAL_INVENTORY, #OBJECT_ID )
string GetCreatureInventoryVar( object oCreature )
{
	return VAR_MODULE_ORIGINAL_INVENTORY+"_"+IntToString( ObjectToInt(oCreature) );
}


// returns CONCAT( VAR_MODULE_ORIGINAL_ANIMAL, #OBJECT_ID )
string GetCreatureAnimalVar( object oCreature )
{
	return VAR_MODULE_ORIGINAL_ANIMAL+"_"+IntToString( ObjectToInt(oCreature) );
}


// returns CONCAT( VAR_MODULE_ORIGINAL_APPEARANCE, #OBJECT_ID )
string GetCreatureAppearanceVar( object oCreature )
{
	return VAR_MODULE_ORIGINAL_APPEARANCE+"_"+IntToString( ObjectToInt(oCreature) );
}

// unsets CONCAT( VAR_MODULE_ORIGINAL_INVENTORY, #OBJECT_ID ) on module
void UnsetCreatureInventoryVar( object oCreature )
{
	string sVar =  VAR_MODULE_ORIGINAL_INVENTORY+"_"+IntToString( ObjectToInt(oCreature) );
	DeleteLocalObject( GetModule(), sVar );
}


// unsets CONCAT( VAR_MODULE_ORIGINAL_ANIMAL, #OBJECT_ID ) on module
void UnsetCreatureAnimalVar( object oCreature )
{
	string sVar =  VAR_MODULE_ORIGINAL_ANIMAL+"_"+IntToString( ObjectToInt(oCreature) );
	DeleteLocalObject( GetModule(), sVar );
}


// unsets CONCAT( VAR_MODULE_ORIGINAL_APPEARANCE, #OBJECT_ID ) on module
void UnsetCreatureAppearanceVar( object oCreature )
{
	string sVar =  VAR_MODULE_ORIGINAL_APPEARANCE+"_"+IntToString( ObjectToInt(oCreature) );
	DeleteLocalInt( GetModule(), sVar );
}

//void main(){}