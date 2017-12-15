#include "DeviousDevices.h"
#define _USE_MATH_DEFINES
#include <math.h>
#include "skse/PapyrusActor.h"
#include "skse/GameForms.h"
#include "skse/GameData.h"
#include "skse/GameObjects.h"
#include "skse/GameReferences.h"
#include "skse/GameExtraData.h"
#include "skse/GameRTTI.h"
#include "skse/GameThreads.h"
#include "skse/HashUtil.h"
#include "skse/PapyrusForm.h"


namespace DeviousDevices {

  BSFixedString GetName(TESForm* thisForm)  {
    if (!thisForm)
      return NULL;
    TESFullName* pFullName = DYNAMIC_CAST(thisForm, TESForm, TESFullName);
    if (pFullName)
      return pFullName->name.data;
    return NULL;
  }

  bool FormHasKeywordString(StaticFunctionTag* base, TESForm* obj, BSFixedString kwd){
    if (!obj) {
      _MESSAGE("FormHasKeywordString received none obj.");
      return false;
    }
    BGSKeywordForm* keywords = DYNAMIC_CAST(obj, TESForm, BGSKeywordForm);
    if (!keywords) {
      _MESSAGE("Keywords cast failed.");
      return false;
    }
    const char* p1 = kwd.data;
    for(int i = 0; i < keywords->numKeywords; ++i) {	
      const char* p2 = keywords->keywords[i]->keyword.Get();
      // _MESSAGE("Comparing %s to %s", p1, p2);
      if (strstr(p2, p1) != NULL)
	return true;
    }
    return false;
  }

  bool FormHasKeyword(StaticFunctionTag* base, TESForm* obj, BGSKeyword* kwd) {
    BGSKeywordForm* keywords = DYNAMIC_CAST(obj, TESForm, BGSKeywordForm);
    if (!keywords) {
      // _MESSAGE("Keywords cast failed.");
      return false;
    }
    const char* p1, *p2;
    for(int i = 0; i < keywords->numKeywords; ++i) {	
      //_MESSAGE("Comparing %s to %s", keyword->keyword.Get(), kwd->keyword.Get());
      p1 = keywords->keywords[i]->keyword.Get();
      p2 = kwd->keyword.Get();
      if ((p1[0] == p2[0]) && // Compare first byte
	  (strcmp(p1, p2) == 0)) // Compare whole string.
	  return true;
    }
    return false;
  }

  // return true if text draw succeeds; false otherwise.
  bool Print(StaticFunctionTag* base, BSFixedString msg){
    // For now, log text 
    _MESSAGE("Received string: %s", msg.data);
    // DrawText
    return false;
  }

  TESForm* FindMatchingDevice(StaticFunctionTag* base, Actor* obj, BGSKeyword* kwd) {
    if (!obj) {
      _MESSAGE("ReEquipExistingDevice received NULL obj.");
      return NULL;
    }
    ExtraContainerChanges* containerChanges = static_cast<ExtraContainerChanges*>(obj->extraData.GetByType(kExtraData_ContainerChanges));
    tList<InventoryEntryData>* inventory = containerChanges->data->objList;
    if (!containerChanges || !inventory) {
      _MESSAGE("ExtraContainerChanges failed.");
      return NULL;
    }
    // _MESSAGE("FindMatchingDevice(%s)", GetName(obj->baseForm));
    for(int i=0;i<inventory->Count();i++) {
      TESForm* tmp = inventory->GetNthItem(i)->type;
      if (!tmp) {
	_MESSAGE("Failed to look up item %d.", i);
	return NULL;
      }
      // _MESSAGE("Item %d: %s", i, GetName(tmp));
      if (FormHasKeyword(base, tmp, kwd)) {
	//	_MESSAGE("Found. Returning %s", GetName(tmp));
	return tmp;
      }
    }
    return NULL;
  }

  bool RegisterFuncs(VMClassRegistry* registry) {
    _MESSAGE("registering functions");

    //    registry->RegisterFunction(new NativeFunction1<StaticFunctionTag, float, float>("TestCos", "zadNativeFunctions", DeviousDevices::TestCos, registry));
    registry->RegisterFunction(new NativeFunction2<StaticFunctionTag, TESForm*, Actor*, BGSKeyword*>("FindMatchingDevice", "zadNativeFunctions", DeviousDevices::FindMatchingDevice, registry));
    registry->RegisterFunction(new NativeFunction2<StaticFunctionTag, bool, TESForm*, BSFixedString>("FormHasKeywordString", "zadNativeFunctions", DeviousDevices::FormHasKeywordString, registry));
    registry->RegisterFunction(new NativeFunction1<StaticFunctionTag, bool, BSFixedString>("Print", "zadNativeFunctions", DeviousDevices::Print, registry));
    //    registry->SetFunctionFlags("zadNativeFunctions", "TestCos", VMClassRegistry::kFunctionFlag_NoWait);
    registry->SetFunctionFlags("zadNativeFunctions", "FindMatchingDevice", VMClassRegistry::kFunctionFlag_NoWait);
    registry->SetFunctionFlags("zadNativeFunctions", "Print", VMClassRegistry::kFunctionFlag_NoWait);
    return true;
  }
} 
