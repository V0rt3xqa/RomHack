#include "global.h"
#include "battle_setup.h"
#include "data.h"
#include "event_data.h"
#include "gym_leader_rematch.h"
#include "international_string_util.h"
#include "main.h"
#include "match_call.h"
#include "overworld.h"
#include "pokemon.h"
#include "pokenav.h"
#include "sound.h"
#include "string_util.h"
#include "strings.h"
#include "constants/flags.h"
#include "constants/songs.h"

//#define ??  id1
#define mapSec      id2  // naming multi-purpose field   
#define headerId    data // naming multi-purpose field

struct Pokenav3Struct
{
    u16 unk0;
    u16 unk2;
    const u8 *matchCallOptions;
    u16 headerId;
    u16 unkA;
    u16 unkC;
    u32 unk10;
    u32 unk14;
    u32 (*callback)(struct Pokenav3Struct*);
    struct PokenavMonList matchCallEntries[MAX_REMATCH_ENTRIES - 1];
};

static u32 CB2_HandleMatchCallInput(struct Pokenav3Struct *);
static u32 sub_81CABFC(struct Pokenav3Struct *);
static u32 sub_81CAC04(struct Pokenav3Struct *);
static u32 sub_81CACB8(struct Pokenav3Struct *);
static u32 sub_81CACF8(struct Pokenav3Struct *);
static u32 sub_81CAD20(s32);
static bool32 sub_81CB1D0(void);

#include "data/text/match_call_messages.h"

static const u8 sMatchCallOptionsNoCheckPage[] = 
{
    MATCH_CALL_OPTION_CALL, 
    MATCH_CALL_OPTION_CANCEL
};

static const u8 sMatchCallOptionsHasCheckPage[] = 
{
    MATCH_CALL_OPTION_CALL, 
    MATCH_CALL_OPTION_CHECK, 
    MATCH_CALL_OPTION_CANCEL
};

bool32 PokenavCallback_Init_11(void)
{
    struct Pokenav3Struct *state = AllocSubstruct(5, sizeof(struct Pokenav3Struct));
    if (!state)
        return FALSE;

    state->callback = CB2_HandleMatchCallInput;
    state->headerId = 0;
    state->unk10 = 0;
    state->unk14 = CreateLoopedTask(sub_81CAD20, 1);
    return TRUE;
}

u32 sub_81CAB24(void)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    return state->callback(state);
}

void sub_81CAB38(void)
{
    FreePokenavSubstruct(5);
}

static u32 CB2_HandleMatchCallInput(struct Pokenav3Struct *state)
{
    int selection;

    if (gMain.newAndRepeatedKeys & DPAD_UP)
        return POKENAV_MC_FUNC_UP;
    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        return POKENAV_MC_FUNC_DOWN;
    if (gMain.newAndRepeatedKeys & DPAD_LEFT)
        return POKENAV_MC_FUNC_PG_UP;
    if (gMain.newAndRepeatedKeys & DPAD_RIGHT)
        return POKENAV_MC_FUNC_PG_DOWN;

    if (gMain.newKeys & A_BUTTON)
    {
        state->callback = sub_81CAC04;
        state->unk0 = 0;
        selection = GetSelectedMatchCall();
        if (!state->matchCallEntries[selection].id1 || MatchCall_HasCheckPage(state->matchCallEntries[selection].headerId))
        {
            state->matchCallOptions = sMatchCallOptionsHasCheckPage;
            state->unk2 = 2;
        }
        else
        {
            state->matchCallOptions = sMatchCallOptionsNoCheckPage;
            state->unk2 = 1;
        }

        return POKENAV_MC_FUNC_SELECT;
    }

    if (gMain.newKeys & B_BUTTON)
    {
        if (GetPokenavMode() != POKENAV_MODE_FORCE_CALL_READY)
        {
            state->callback = sub_81CABFC;
            return POKENAV_MC_FUNC_EXIT;
        }
        else
        {
            // Cant exit Match Call menu before calling Mr Stone during tutorial
            PlaySE(SE_HAZURE);
        }
    }

    return POKENAV_MC_FUNC_NONE;
}

static u32 sub_81CABFC(struct Pokenav3Struct *state)
{
    return POKENAV_MENU_4;
}

static u32 sub_81CAC04(struct Pokenav3Struct *state)
{
    if ((gMain.newKeys & DPAD_UP) && state->unk0)
    {
        state->unk0--;
        return POKENAV_MC_FUNC_6;
    }

    if ((gMain.newKeys & DPAD_DOWN) && state->unk0 < state->unk2)
    {
        state->unk0++;
        return POKENAV_MC_FUNC_6;
    }

    if (gMain.newKeys & A_BUTTON)
    {
        switch (state->matchCallOptions[state->unk0])
        {
        case MATCH_CALL_OPTION_CANCEL:
            state->callback = CB2_HandleMatchCallInput;
            return POKENAV_MC_FUNC_7;
        case MATCH_CALL_OPTION_CALL:
            if (GetPokenavMode() == POKENAV_MODE_FORCE_CALL_READY)
                SetPokenavMode(POKENAV_MODE_FORCE_CALL_EXIT);

            state->callback = sub_81CACF8;
            if (sub_81CB1D0())
                return POKENAV_MC_FUNC_NEARBY_MSG;

            return POKENAV_MC_FUNC_CALL_MSG;
        case MATCH_CALL_OPTION_CHECK:
            state->callback = sub_81CACB8;
            return POKENAV_MC_FUNC_11;
        }
    }

    if (gMain.newKeys & B_BUTTON)
    {
        state->callback = CB2_HandleMatchCallInput;
        return POKENAV_MC_FUNC_7;
    }

    return POKENAV_MC_FUNC_NONE;
}

static u32 sub_81CACB8(struct Pokenav3Struct *state)
{
    if (gMain.newAndRepeatedKeys & DPAD_UP)
        return POKENAV_MC_FUNC_12;
    if (gMain.newAndRepeatedKeys & DPAD_DOWN)
        return POKENAV_MC_FUNC_13;

    if (gMain.newKeys & B_BUTTON)
    {
        state->callback = CB2_HandleMatchCallInput;
        return POKENAV_MC_FUNC_14;
    }

    return POKENAV_MC_FUNC_NONE;
}

static u32 sub_81CACF8(struct Pokenav3Struct *state)
{
    if (gMain.newKeys & (A_BUTTON | B_BUTTON))
    {
        state->callback = CB2_HandleMatchCallInput;
        return POKENAV_MC_FUNC_10;
    }

    return POKENAV_MC_FUNC_NONE;
}

static u32 sub_81CAD20(s32 taskState)
{
    int i, j;
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    switch (taskState)
    {
    case 0:
        state->headerId = 0;
        state->unkA = 0;
        return LT_INC_AND_CONTINUE;
    case 1:
        for (i = 0, j = state->headerId; i < 30; i++, j++)
        {
            if (MatchCallFlagGetByIndex(j))
            {
                state->matchCallEntries[state->unkA].headerId = j;
                state->matchCallEntries[state->unkA].id1 = TRUE;
                state->matchCallEntries[state->unkA].mapSec = MatchCallMapSecGetByIndex(j);
                state->unkA++;
            }

            if (++state->headerId >= MC_HEADER_COUNT)
            {
                state->unkC = state->headerId;
                state->headerId = 0;
                return LT_INC_AND_CONTINUE;
            }
        }

        return LT_CONTINUE;
    case 2:
        for (i = 0, j = state->headerId; i < 30; i++, j++)
        {
            if (!sub_81D1BF8(state->headerId) && IsRematchEntryRegistered(state->headerId))
            {
                state->matchCallEntries[state->unkA].headerId = state->headerId;
                state->matchCallEntries[state->unkA].id1 = FALSE;
                state->matchCallEntries[state->unkA].mapSec = sub_81CB0C8(j);
                state->unkA++;
            }

            if (++state->headerId > REMATCH_TABLE_ENTRIES - 1)
                return LT_INC_AND_CONTINUE;
        }

        return LT_CONTINUE;
    case 3:
        state->unk10 = 1;
        break;
    }

    return LT_FINISH;
}

bool32 IsRematchEntryRegistered(int rematchIndex)
{
    if (rematchIndex < REMATCH_TABLE_ENTRIES)
        return FlagGet(FLAG_MATCH_CALL_REGISTERED + rematchIndex);

    return FALSE;
}

int sub_81CAE28(void)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    return state->unk10;
}

int sub_81CAE38(void)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    return state->unkA;
}

int sub_81CAE48(void)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    return state->unkC;
}

int unref_sub_81CAE58(void)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    return state->unkA - state->unkC;
}

int unref_sub_81CAE6C(int arg0)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    arg0 += state->unkC;
    if (arg0 >= state->unkA)
        return REMATCH_TABLE_ENTRIES;

    return state->matchCallEntries[arg0].headerId;
}

struct PokenavMonList *sub_81CAE94(void)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    return state->matchCallEntries;
}

u16 sub_81CAEA4(int index)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    return state->matchCallEntries[index].mapSec;
}

bool32 sub_81CAEBC(int index)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    if (!state->matchCallEntries[index].id1)
        index = state->matchCallEntries[index].headerId;
    else
        index = MatchCall_GetRematchTableIdx(state->matchCallEntries[index].headerId);

    if (index == REMATCH_TABLE_ENTRIES)
        return FALSE;

    return gSaveBlock1Ptr->trainerRematches[index] != 0;
}

int GetMatchCallTrainerPic(int index)
{
    int var0;
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    if (!state->matchCallEntries[index].id1)
    {
        index = GetTrainerIdxByRematchIdx(state->matchCallEntries[index].headerId);
        return gTrainers[index].trainerPic;
    }

    var0 = state->matchCallEntries[index].headerId;
    index = MatchCall_GetRematchTableIdx(var0);
    if (index != REMATCH_TABLE_ENTRIES)
    {
        index = GetTrainerIdxByRematchIdx(index);
        return gTrainers[index].trainerPic;
    }

    index = MatchCall_GetOverrideFacilityClass(var0);
    return gFacilityClassToPicIndex[index];
}

const u8 *GetMatchCallMessageText(int index, u8 *arg1)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    *arg1 = 0;
    if (!Overworld_MapTypeAllowsTeleportAndFly(gMapHeader.mapType))
        return gText_CallCantBeMadeHere;

    if (!state->matchCallEntries[index].id1)
        *arg1 = SelectMatchCallMessage(GetTrainerIdxByRematchIdx(state->matchCallEntries[index].headerId), gStringVar4);
    else
        MatchCall_GetMessage(state->matchCallEntries[index].headerId, gStringVar4);

    return gStringVar4;
}

const u8 *GetMatchCallFlavorText(int index, int checkPageEntry)
{
    int rematchId;
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    if (state->matchCallEntries[index].id1)
    {
        rematchId = MatchCall_GetRematchTableIdx(state->matchCallEntries[index].headerId);
        if (rematchId == REMATCH_TABLE_ENTRIES)
            return MatchCall_GetOverrideFlavorText(state->matchCallEntries[index].headerId, checkPageEntry);
    }
    else
    {
        rematchId = state->matchCallEntries[index].headerId;
    }

    return gMatchCallFlavorTexts[rematchId][checkPageEntry];
}

u16 sub_81CB01C(void)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    return state->unk0;
}

u16 sub_81CB02C(int arg0)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    if (state->unk2 < arg0)
        return MATCH_CALL_OPTION_COUNT;

    return state->matchCallOptions[arg0];
}

void sub_81CB050(struct PokenavMonList * arg0, u8 *str)
{
    const u8 *trainerName;
    const u8 *className;
    if (!arg0->id1)
    {
        int index = GetTrainerIdxByRematchIdx(arg0->headerId);
        const struct Trainer *trainer = &gTrainers[index];
        int class = trainer->trainerClass;
        className = gTrainerClassNames[class];
        trainerName = trainer->trainerName;
    }
    else
    {
        sub_81D1A78(arg0->headerId, &className, &trainerName);
    }

    if (className && trainerName)
    {
        u8 *str2 = sub_81DB494(str, 7, className, 69);
        sub_81DB494(str2, 7, trainerName, 51);
    }
    else
    {
        sub_81DB494(str, 7, NULL, 120);
    }
}

u8 sub_81CB0C8(int rematchIndex)
{
    int mapGroup = gRematchTable[rematchIndex].mapGroup;
    int mapNum = gRematchTable[rematchIndex].mapNum;
    return Overworld_GetMapHeaderByGroupAndId(mapGroup, mapNum)->regionMapSectionId;
}

int sub_81CB0E4(int index)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    int count = 1;
    while (++index < state->unkA)
    {
        if (!state->matchCallEntries[index].id1)
            return count;
        if (MatchCall_HasCheckPage(state->matchCallEntries[index].headerId))
            return count;

        count++;
    }

    return 0;
}

int sub_81CB128(int index)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    int count = -1;
    while (--index >= 0)
    {
        if (!state->matchCallEntries[index].id1)
            return count;
        if (MatchCall_HasCheckPage(state->matchCallEntries[index].headerId))
            return count;

        count--;
    }

    return 0;
}

bool32 unref_sub_81CB16C(void)
{
    int i;

    for (i = 0; i < REMATCH_TABLE_ENTRIES; i++)
    {
        if (IsRematchEntryRegistered(i) && gSaveBlock1Ptr->trainerRematches[i])
            return TRUE;
    }

    for (i = 0; i < MC_HEADER_COUNT; i++)
    {
        if (MatchCallFlagGetByIndex(i))
        {
            int index = MatchCall_GetRematchTableIdx(i);
            if (gSaveBlock1Ptr->trainerRematches[index])
                return TRUE;
        }
    }

    return FALSE;
}

static bool32 sub_81CB1D0(void)
{
    struct Pokenav3Struct *state = GetSubstructPtr(5);
    int selection = GetSelectedMatchCall();
    if (!state->matchCallEntries[selection].id1)
    {
        if (sub_81CAEA4(selection) == gMapHeader.regionMapSectionId)
        {
            if (!gSaveBlock1Ptr->trainerRematches[state->matchCallEntries[selection].headerId])
                return TRUE;
        }
    }
    else
    {
        if (state->matchCallEntries[selection].headerId == MC_HEADER_WATTSON)
        {
            if (sub_81CAEA4(selection) == gMapHeader.regionMapSectionId
             && FlagGet(FLAG_BADGE05_GET) == TRUE)
            {
                if (!FlagGet(FLAG_WATTSON_REMATCH_AVAILABLE))
                    return TRUE;
            }
        }
    }

    return FALSE;
}
