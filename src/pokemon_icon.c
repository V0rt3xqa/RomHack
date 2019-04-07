#include "global.h"
#include "graphics.h"
#include "mail.h"
#include "palette.h"
#include "pokemon_icon.h"
#include "sprite.h"
#include "constants/species.h"

#define POKE_ICON_BASE_PAL_TAG 56000

struct MonIconSpriteTemplate
{
    const struct OamData *oam;
    const u8 *image;
    const union AnimCmd *const *anims;
    const union AffineAnimCmd *const *affineAnims;
    void (*callback)(struct Sprite *);
    u16 paletteTag;
};

// static functions
static u8 CreateMonIconSprite(struct MonIconSpriteTemplate *, s16, s16, u8);

// .rodata

const u8 *const gMonIconTable[] =
{
    [SPECIES_NONE] = gMonIcon_Bulbasaur,
    [SPECIES_BULBASAUR] = gMonIcon_Bulbasaur,
    [SPECIES_IVYSAUR] = gMonIcon_Ivysaur,
    [SPECIES_VENUSAUR] = gMonIcon_Venusaur,
    [SPECIES_CHARMANDER] = gMonIcon_Charmander,
    [SPECIES_CHARMELEON] = gMonIcon_Charmeleon,
    [SPECIES_CHARIZARD] = gMonIcon_Charizard,
    [SPECIES_SQUIRTLE] = gMonIcon_Squirtle,
    [SPECIES_WARTORTLE] = gMonIcon_Wartortle,
    [SPECIES_BLASTOISE] = gMonIcon_Blastoise,
    [SPECIES_CATERPIE] = gMonIcon_Caterpie,
    [SPECIES_METAPOD] = gMonIcon_Metapod,
    [SPECIES_BUTTERFREE] = gMonIcon_Butterfree,
    [SPECIES_WEEDLE] = gMonIcon_Weedle,
    [SPECIES_KAKUNA] = gMonIcon_Kakuna,
    [SPECIES_BEEDRILL] = gMonIcon_Beedrill,
    [SPECIES_PIDGEY] = gMonIcon_Pidgey,
    [SPECIES_PIDGEOTTO] = gMonIcon_Pidgeotto,
    [SPECIES_PIDGEOT] = gMonIcon_Pidgeot,
    [SPECIES_RATTATA] = gMonIcon_Rattata,
    [SPECIES_RATICATE] = gMonIcon_Raticate,
    [SPECIES_SPEAROW] = gMonIcon_Spearow,
    [SPECIES_FEAROW] = gMonIcon_Fearow,
    [SPECIES_EKANS] = gMonIcon_Ekans,
    [SPECIES_ARBOK] = gMonIcon_Arbok,
    [SPECIES_PIKACHU] = gMonIcon_Pikachu,
    [SPECIES_RAICHU] = gMonIcon_Raichu,
    [SPECIES_SANDSHREW] = gMonIcon_Sandshrew,
    [SPECIES_SANDSLASH] = gMonIcon_Sandslash,
    [SPECIES_NIDORAN_F] = gMonIcon_NidoranF,
    [SPECIES_NIDORINA] = gMonIcon_Nidorina,
    [SPECIES_NIDOQUEEN] = gMonIcon_Nidoqueen,
    [SPECIES_NIDORAN_M] = gMonIcon_NidoranM,
    [SPECIES_NIDORINO] = gMonIcon_Nidorino,
    [SPECIES_NIDOKING] = gMonIcon_Nidoking,
    [SPECIES_CLEFAIRY] = gMonIcon_Clefairy,
    [SPECIES_CLEFABLE] = gMonIcon_Clefable,
    [SPECIES_VULPIX] = gMonIcon_Vulpix,
    [SPECIES_NINETALES] = gMonIcon_Ninetales,
    [SPECIES_JIGGLYPUFF] = gMonIcon_Jigglypuff,
    [SPECIES_WIGGLYTUFF] = gMonIcon_Wigglytuff,
    [SPECIES_ZUBAT] = gMonIcon_Zubat,
    [SPECIES_GOLBAT] = gMonIcon_Golbat,
    [SPECIES_ODDISH] = gMonIcon_Oddish,
    [SPECIES_GLOOM] = gMonIcon_Gloom,
    [SPECIES_VILEPLUME] = gMonIcon_Vileplume,
    [SPECIES_PARAS] = gMonIcon_Paras,
    [SPECIES_PARASECT] = gMonIcon_Parasect,
    [SPECIES_VENONAT] = gMonIcon_Venonat,
    [SPECIES_VENOMOTH] = gMonIcon_Venomoth,
    [SPECIES_DIGLETT] = gMonIcon_Diglett,
    [SPECIES_DUGTRIO] = gMonIcon_Dugtrio,
    [SPECIES_MEOWTH] = gMonIcon_Meowth,
    [SPECIES_PERSIAN] = gMonIcon_Persian,
    [SPECIES_PSYDUCK] = gMonIcon_Psyduck,
    [SPECIES_GOLDUCK] = gMonIcon_Golduck,
    [SPECIES_MANKEY] = gMonIcon_Mankey,
    [SPECIES_PRIMEAPE] = gMonIcon_Primeape,
    [SPECIES_GROWLITHE] = gMonIcon_Growlithe,
    [SPECIES_ARCANINE] = gMonIcon_Arcanine,
    [SPECIES_POLIWAG] = gMonIcon_Poliwag,
    [SPECIES_POLIWHIRL] = gMonIcon_Poliwhirl,
    [SPECIES_POLIWRATH] = gMonIcon_Poliwrath,
    [SPECIES_ABRA] = gMonIcon_Abra,
    [SPECIES_KADABRA] = gMonIcon_Kadabra,
    [SPECIES_ALAKAZAM] = gMonIcon_Alakazam,
    [SPECIES_MACHOP] = gMonIcon_Machop,
    [SPECIES_MACHOKE] = gMonIcon_Machoke,
    [SPECIES_MACHAMP] = gMonIcon_Machamp,
    [SPECIES_BELLSPROUT] = gMonIcon_Bellsprout,
    [SPECIES_WEEPINBELL] = gMonIcon_Weepinbell,
    [SPECIES_VICTREEBEL] = gMonIcon_Victreebel,
    [SPECIES_TENTACOOL] = gMonIcon_Tentacool,
    [SPECIES_TENTACRUEL] = gMonIcon_Tentacruel,
    [SPECIES_GEODUDE] = gMonIcon_Geodude,
    [SPECIES_GRAVELER] = gMonIcon_Graveler,
    [SPECIES_GOLEM] = gMonIcon_Golem,
    [SPECIES_PONYTA] = gMonIcon_Ponyta,
    [SPECIES_RAPIDASH] = gMonIcon_Rapidash,
    [SPECIES_SLOWPOKE] = gMonIcon_Slowpoke,
    [SPECIES_SLOWBRO] = gMonIcon_Slowbro,
    [SPECIES_MAGNEMITE] = gMonIcon_Magnemite,
    [SPECIES_MAGNETON] = gMonIcon_Magneton,
    [SPECIES_FARFETCHD] = gMonIcon_Farfetchd,
    [SPECIES_DODUO] = gMonIcon_Doduo,
    [SPECIES_DODRIO] = gMonIcon_Dodrio,
    [SPECIES_SEEL] = gMonIcon_Seel,
    [SPECIES_DEWGONG] = gMonIcon_Dewgong,
    [SPECIES_GRIMER] = gMonIcon_Grimer,
    [SPECIES_MUK] = gMonIcon_Muk,
    [SPECIES_SHELLDER] = gMonIcon_Shellder,
    [SPECIES_CLOYSTER] = gMonIcon_Cloyster,
    [SPECIES_GASTLY] = gMonIcon_Gastly,
    [SPECIES_HAUNTER] = gMonIcon_Haunter,
    [SPECIES_GENGAR] = gMonIcon_Gengar,
    [SPECIES_ONIX] = gMonIcon_Onix,
    [SPECIES_DROWZEE] = gMonIcon_Drowzee,
    [SPECIES_HYPNO] = gMonIcon_Hypno,
    [SPECIES_KRABBY] = gMonIcon_Krabby,
    [SPECIES_KINGLER] = gMonIcon_Kingler,
    [SPECIES_VOLTORB] = gMonIcon_Voltorb,
    [SPECIES_ELECTRODE] = gMonIcon_Electrode,
    [SPECIES_EXEGGCUTE] = gMonIcon_Exeggcute,
    [SPECIES_EXEGGUTOR] = gMonIcon_Exeggutor,
    [SPECIES_CUBONE] = gMonIcon_Cubone,
    [SPECIES_MAROWAK] = gMonIcon_Marowak,
    [SPECIES_HITMONLEE] = gMonIcon_Hitmonlee,
    [SPECIES_HITMONCHAN] = gMonIcon_Hitmonchan,
    [SPECIES_LICKITUNG] = gMonIcon_Lickitung,
    [SPECIES_KOFFING] = gMonIcon_Koffing,
    [SPECIES_WEEZING] = gMonIcon_Weezing,
    [SPECIES_RHYHORN] = gMonIcon_Rhyhorn,
    [SPECIES_RHYDON] = gMonIcon_Rhydon,
    [SPECIES_CHANSEY] = gMonIcon_Chansey,
    [SPECIES_TANGELA] = gMonIcon_Tangela,
    [SPECIES_KANGASKHAN] = gMonIcon_Kangaskhan,
    [SPECIES_HORSEA] = gMonIcon_Horsea,
    [SPECIES_SEADRA] = gMonIcon_Seadra,
    [SPECIES_GOLDEEN] = gMonIcon_Goldeen,
    [SPECIES_SEAKING] = gMonIcon_Seaking,
    [SPECIES_STARYU] = gMonIcon_Staryu,
    [SPECIES_STARMIE] = gMonIcon_Starmie,
    [SPECIES_MR_MIME] = gMonIcon_Mrmime,
    [SPECIES_SCYTHER] = gMonIcon_Scyther,
    [SPECIES_JYNX] = gMonIcon_Jynx,
    [SPECIES_ELECTABUZZ] = gMonIcon_Electabuzz,
    [SPECIES_MAGMAR] = gMonIcon_Magmar,
    [SPECIES_PINSIR] = gMonIcon_Pinsir,
    [SPECIES_TAUROS] = gMonIcon_Tauros,
    [SPECIES_MAGIKARP] = gMonIcon_Magikarp,
    [SPECIES_GYARADOS] = gMonIcon_Gyarados,
    [SPECIES_LAPRAS] = gMonIcon_Lapras,
    [SPECIES_DITTO] = gMonIcon_Ditto,
    [SPECIES_EEVEE] = gMonIcon_Eevee,
    [SPECIES_VAPOREON] = gMonIcon_Vaporeon,
    [SPECIES_JOLTEON] = gMonIcon_Jolteon,
    [SPECIES_FLAREON] = gMonIcon_Flareon,
    [SPECIES_PORYGON] = gMonIcon_Porygon,
    [SPECIES_OMANYTE] = gMonIcon_Omanyte,
    [SPECIES_OMASTAR] = gMonIcon_Omastar,
    [SPECIES_KABUTO] = gMonIcon_Kabuto,
    [SPECIES_KABUTOPS] = gMonIcon_Kabutops,
    [SPECIES_AERODACTYL] = gMonIcon_Aerodactyl,
    [SPECIES_SNORLAX] = gMonIcon_Snorlax,
    [SPECIES_ARTICUNO] = gMonIcon_Articuno,
    [SPECIES_ZAPDOS] = gMonIcon_Zapdos,
    [SPECIES_MOLTRES] = gMonIcon_Moltres,
    [SPECIES_DRATINI] = gMonIcon_Dratini,
    [SPECIES_DRAGONAIR] = gMonIcon_Dragonair,
    [SPECIES_DRAGONITE] = gMonIcon_Dragonite,
    [SPECIES_MEWTWO] = gMonIcon_Mewtwo,
    [SPECIES_MEW] = gMonIcon_Mew,
    [SPECIES_CHIKORITA] = gMonIcon_Chikorita,
    [SPECIES_BAYLEEF] = gMonIcon_Bayleef,
    [SPECIES_MEGANIUM] = gMonIcon_Meganium,
    [SPECIES_CYNDAQUIL] = gMonIcon_Cyndaquil,
    [SPECIES_QUILAVA] = gMonIcon_Quilava,
    [SPECIES_TYPHLOSION] = gMonIcon_Typhlosion,
    [SPECIES_TOTODILE] = gMonIcon_Totodile,
    [SPECIES_CROCONAW] = gMonIcon_Croconaw,
    [SPECIES_FERALIGATR] = gMonIcon_Feraligatr,
    [SPECIES_SENTRET] = gMonIcon_Sentret,
    [SPECIES_FURRET] = gMonIcon_Furret,
    [SPECIES_HOOTHOOT] = gMonIcon_Hoothoot,
    [SPECIES_NOCTOWL] = gMonIcon_Noctowl,
    [SPECIES_LEDYBA] = gMonIcon_Ledyba,
    [SPECIES_LEDIAN] = gMonIcon_Ledian,
    [SPECIES_SPINARAK] = gMonIcon_Spinarak,
    [SPECIES_ARIADOS] = gMonIcon_Ariados,
    [SPECIES_CROBAT] = gMonIcon_Crobat,
    [SPECIES_CHINCHOU] = gMonIcon_Chinchou,
    [SPECIES_LANTURN] = gMonIcon_Lanturn,
    [SPECIES_PICHU] = gMonIcon_Pichu,
    [SPECIES_CLEFFA] = gMonIcon_Cleffa,
    [SPECIES_IGGLYBUFF] = gMonIcon_Igglybuff,
    [SPECIES_TOGEPI] = gMonIcon_Togepi,
    [SPECIES_TOGETIC] = gMonIcon_Togetic,
    [SPECIES_NATU] = gMonIcon_Natu,
    [SPECIES_XATU] = gMonIcon_Xatu,
    [SPECIES_MAREEP] = gMonIcon_Mareep,
    [SPECIES_FLAAFFY] = gMonIcon_Flaaffy,
    [SPECIES_AMPHAROS] = gMonIcon_Ampharos,
    [SPECIES_BELLOSSOM] = gMonIcon_Bellossom,
    [SPECIES_MARILL] = gMonIcon_Marill,
    [SPECIES_AZUMARILL] = gMonIcon_Azumarill,
    [SPECIES_SUDOWOODO] = gMonIcon_Sudowoodo,
    [SPECIES_POLITOED] = gMonIcon_Politoed,
    [SPECIES_HOPPIP] = gMonIcon_Hoppip,
    [SPECIES_SKIPLOOM] = gMonIcon_Skiploom,
    [SPECIES_JUMPLUFF] = gMonIcon_Jumpluff,
    [SPECIES_AIPOM] = gMonIcon_Aipom,
    [SPECIES_SUNKERN] = gMonIcon_Sunkern,
    [SPECIES_SUNFLORA] = gMonIcon_Sunflora,
    [SPECIES_YANMA] = gMonIcon_Yanma,
    [SPECIES_WOOPER] = gMonIcon_Wooper,
    [SPECIES_QUAGSIRE] = gMonIcon_Quagsire,
    [SPECIES_ESPEON] = gMonIcon_Espeon,
    [SPECIES_UMBREON] = gMonIcon_Umbreon,
    [SPECIES_MURKROW] = gMonIcon_Murkrow,
    [SPECIES_SLOWKING] = gMonIcon_Slowking,
    [SPECIES_MISDREAVUS] = gMonIcon_Misdreavus,
    [SPECIES_UNOWN] = gMonIcon_UnownA,
    [SPECIES_WOBBUFFET] = gMonIcon_Wobbuffet,
    [SPECIES_GIRAFARIG] = gMonIcon_Girafarig,
    [SPECIES_PINECO] = gMonIcon_Pineco,
    [SPECIES_FORRETRESS] = gMonIcon_Forretress,
    [SPECIES_DUNSPARCE] = gMonIcon_Dunsparce,
    [SPECIES_GLIGAR] = gMonIcon_Gligar,
    [SPECIES_STEELIX] = gMonIcon_Steelix,
    [SPECIES_SNUBBULL] = gMonIcon_Snubbull,
    [SPECIES_GRANBULL] = gMonIcon_Granbull,
    [SPECIES_QWILFISH] = gMonIcon_Qwilfish,
    [SPECIES_SCIZOR] = gMonIcon_Scizor,
    [SPECIES_SHUCKLE] = gMonIcon_Shuckle,
    [SPECIES_HERACROSS] = gMonIcon_Heracross,
    [SPECIES_SNEASEL] = gMonIcon_Sneasel,
    [SPECIES_TEDDIURSA] = gMonIcon_Teddiursa,
    [SPECIES_URSARING] = gMonIcon_Ursaring,
    [SPECIES_SLUGMA] = gMonIcon_Slugma,
    [SPECIES_MAGCARGO] = gMonIcon_Magcargo,
    [SPECIES_SWINUB] = gMonIcon_Swinub,
    [SPECIES_PILOSWINE] = gMonIcon_Piloswine,
    [SPECIES_CORSOLA] = gMonIcon_Corsola,
    [SPECIES_REMORAID] = gMonIcon_Remoraid,
    [SPECIES_OCTILLERY] = gMonIcon_Octillery,
    [SPECIES_DELIBIRD] = gMonIcon_Delibird,
    [SPECIES_MANTINE] = gMonIcon_Mantine,
    [SPECIES_SKARMORY] = gMonIcon_Skarmory,
    [SPECIES_HOUNDOUR] = gMonIcon_Houndour,
    [SPECIES_HOUNDOOM] = gMonIcon_Houndoom,
    [SPECIES_KINGDRA] = gMonIcon_Kingdra,
    [SPECIES_PHANPY] = gMonIcon_Phanpy,
    [SPECIES_DONPHAN] = gMonIcon_Donphan,
    [SPECIES_PORYGON2] = gMonIcon_Porygon2,
    [SPECIES_STANTLER] = gMonIcon_Stantler,
    [SPECIES_SMEARGLE] = gMonIcon_Smeargle,
    [SPECIES_TYROGUE] = gMonIcon_Tyrogue,
    [SPECIES_HITMONTOP] = gMonIcon_Hitmontop,
    [SPECIES_SMOOCHUM] = gMonIcon_Smoochum,
    [SPECIES_ELEKID] = gMonIcon_Elekid,
    [SPECIES_MAGBY] = gMonIcon_Magby,
    [SPECIES_MILTANK] = gMonIcon_Miltank,
    [SPECIES_BLISSEY] = gMonIcon_Blissey,
    [SPECIES_RAIKOU] = gMonIcon_Raikou,
    [SPECIES_ENTEI] = gMonIcon_Entei,
    [SPECIES_SUICUNE] = gMonIcon_Suicune,
    [SPECIES_LARVITAR] = gMonIcon_Larvitar,
    [SPECIES_PUPITAR] = gMonIcon_Pupitar,
    [SPECIES_TYRANITAR] = gMonIcon_Tyranitar,
    [SPECIES_LUGIA] = gMonIcon_Lugia,
    [SPECIES_HO_OH] = gMonIcon_HoOh,
    [SPECIES_CELEBI] = gMonIcon_Celebi,
    [SPECIES_TREECKO] = gMonIcon_Treecko,
    [SPECIES_GROVYLE] = gMonIcon_Grovyle,
    [SPECIES_SCEPTILE] = gMonIcon_Sceptile,
    [SPECIES_TORCHIC] = gMonIcon_Torchic,
    [SPECIES_COMBUSKEN] = gMonIcon_Combusken,
    [SPECIES_BLAZIKEN] = gMonIcon_Blaziken,
    [SPECIES_MUDKIP] = gMonIcon_Mudkip,
    [SPECIES_MARSHTOMP] = gMonIcon_Marshtomp,
    [SPECIES_SWAMPERT] = gMonIcon_Swampert,
    [SPECIES_POOCHYENA] = gMonIcon_Poochyena,
    [SPECIES_MIGHTYENA] = gMonIcon_Mightyena,
    [SPECIES_ZIGZAGOON] = gMonIcon_Zigzagoon,
    [SPECIES_LINOONE] = gMonIcon_Linoone,
    [SPECIES_WURMPLE] = gMonIcon_Wurmple,
    [SPECIES_SILCOON] = gMonIcon_Silcoon,
    [SPECIES_BEAUTIFLY] = gMonIcon_Beautifly,
    [SPECIES_CASCOON] = gMonIcon_Cascoon,
    [SPECIES_DUSTOX] = gMonIcon_Dustox,
    [SPECIES_LOTAD] = gMonIcon_Lotad,
    [SPECIES_LOMBRE] = gMonIcon_Lombre,
    [SPECIES_LUDICOLO] = gMonIcon_Ludicolo,
    [SPECIES_SEEDOT] = gMonIcon_Seedot,
    [SPECIES_NUZLEAF] = gMonIcon_Nuzleaf,
    [SPECIES_SHIFTRY] = gMonIcon_Shiftry,
    [SPECIES_NINCADA] = gMonIcon_Nincada,
    [SPECIES_NINJASK] = gMonIcon_Ninjask,
    [SPECIES_SHEDINJA] = gMonIcon_Shedinja,
    [SPECIES_TAILLOW] = gMonIcon_Taillow,
    [SPECIES_SWELLOW] = gMonIcon_Swellow,
    [SPECIES_SHROOMISH] = gMonIcon_Shroomish,
    [SPECIES_BRELOOM] = gMonIcon_Breloom,
    [SPECIES_SPINDA] = gMonIcon_Spinda,
    [SPECIES_WINGULL] = gMonIcon_Wingull,
    [SPECIES_PELIPPER] = gMonIcon_Pelipper,
    [SPECIES_SURSKIT] = gMonIcon_Surskit,
    [SPECIES_MASQUERAIN] = gMonIcon_Masquerain,
    [SPECIES_WAILMER] = gMonIcon_Wailmer,
    [SPECIES_WAILORD] = gMonIcon_Wailord,
    [SPECIES_SKITTY] = gMonIcon_Skitty,
    [SPECIES_DELCATTY] = gMonIcon_Delcatty,
    [SPECIES_KECLEON] = gMonIcon_Kecleon,
    [SPECIES_BALTOY] = gMonIcon_Baltoy,
    [SPECIES_CLAYDOL] = gMonIcon_Claydol,
    [SPECIES_NOSEPASS] = gMonIcon_Nosepass,
    [SPECIES_TORKOAL] = gMonIcon_Torkoal,
    [SPECIES_SABLEYE] = gMonIcon_Sableye,
    [SPECIES_BARBOACH] = gMonIcon_Barboach,
    [SPECIES_WHISCASH] = gMonIcon_Whiscash,
    [SPECIES_LUVDISC] = gMonIcon_Luvdisc,
    [SPECIES_CORPHISH] = gMonIcon_Corphish,
    [SPECIES_CRAWDAUNT] = gMonIcon_Crawdaunt,
    [SPECIES_FEEBAS] = gMonIcon_Feebas,
    [SPECIES_MILOTIC] = gMonIcon_Milotic,
    [SPECIES_CARVANHA] = gMonIcon_Carvanha,
    [SPECIES_SHARPEDO] = gMonIcon_Sharpedo,
    [SPECIES_TRAPINCH] = gMonIcon_Trapinch,
    [SPECIES_VIBRAVA] = gMonIcon_Vibrava,
    [SPECIES_FLYGON] = gMonIcon_Flygon,
    [SPECIES_MAKUHITA] = gMonIcon_Makuhita,
    [SPECIES_HARIYAMA] = gMonIcon_Hariyama,
    [SPECIES_ELECTRIKE] = gMonIcon_Electrike,
    [SPECIES_MANECTRIC] = gMonIcon_Manectric,
    [SPECIES_NUMEL] = gMonIcon_Numel,
    [SPECIES_CAMERUPT] = gMonIcon_Camerupt,
    [SPECIES_SPHEAL] = gMonIcon_Spheal,
    [SPECIES_SEALEO] = gMonIcon_Sealeo,
    [SPECIES_WALREIN] = gMonIcon_Walrein,
    [SPECIES_CACNEA] = gMonIcon_Cacnea,
    [SPECIES_CACTURNE] = gMonIcon_Cacturne,
    [SPECIES_SNORUNT] = gMonIcon_Snorunt,
    [SPECIES_GLALIE] = gMonIcon_Glalie,
    [SPECIES_LUNATONE] = gMonIcon_Lunatone,
    [SPECIES_SOLROCK] = gMonIcon_Solrock,
    [SPECIES_AZURILL] = gMonIcon_Azurill,
    [SPECIES_SPOINK] = gMonIcon_Spoink,
    [SPECIES_GRUMPIG] = gMonIcon_Grumpig,
    [SPECIES_PLUSLE] = gMonIcon_Plusle,
    [SPECIES_MINUN] = gMonIcon_Minun,
    [SPECIES_MAWILE] = gMonIcon_Mawile,
    [SPECIES_MEDITITE] = gMonIcon_Meditite,
    [SPECIES_MEDICHAM] = gMonIcon_Medicham,
    [SPECIES_SWABLU] = gMonIcon_Swablu,
    [SPECIES_ALTARIA] = gMonIcon_Altaria,
    [SPECIES_WYNAUT] = gMonIcon_Wynaut,
    [SPECIES_DUSKULL] = gMonIcon_Duskull,
    [SPECIES_DUSCLOPS] = gMonIcon_Dusclops,
    [SPECIES_ROSELIA] = gMonIcon_Roselia,
    [SPECIES_SLAKOTH] = gMonIcon_Slakoth,
    [SPECIES_VIGOROTH] = gMonIcon_Vigoroth,
    [SPECIES_SLAKING] = gMonIcon_Slaking,
    [SPECIES_GULPIN] = gMonIcon_Gulpin,
    [SPECIES_SWALOT] = gMonIcon_Swalot,
    [SPECIES_TROPIUS] = gMonIcon_Tropius,
    [SPECIES_WHISMUR] = gMonIcon_Whismur,
    [SPECIES_LOUDRED] = gMonIcon_Loudred,
    [SPECIES_EXPLOUD] = gMonIcon_Exploud,
    [SPECIES_CLAMPERL] = gMonIcon_Clamperl,
    [SPECIES_HUNTAIL] = gMonIcon_Huntail,
    [SPECIES_GOREBYSS] = gMonIcon_Gorebyss,
    [SPECIES_ABSOL] = gMonIcon_Absol,
    [SPECIES_SHUPPET] = gMonIcon_Shuppet,
    [SPECIES_BANETTE] = gMonIcon_Banette,
    [SPECIES_SEVIPER] = gMonIcon_Seviper,
    [SPECIES_ZANGOOSE] = gMonIcon_Zangoose,
    [SPECIES_RELICANTH] = gMonIcon_Relicanth,
    [SPECIES_ARON] = gMonIcon_Aron,
    [SPECIES_LAIRON] = gMonIcon_Lairon,
    [SPECIES_AGGRON] = gMonIcon_Aggron,
    [SPECIES_CASTFORM] = gMonIcon_Castform,
    [SPECIES_VOLBEAT] = gMonIcon_Volbeat,
    [SPECIES_ILLUMISE] = gMonIcon_Illumise,
    [SPECIES_LILEEP] = gMonIcon_Lileep,
    [SPECIES_CRADILY] = gMonIcon_Cradily,
    [SPECIES_ANORITH] = gMonIcon_Anorith,
    [SPECIES_ARMALDO] = gMonIcon_Armaldo,
    [SPECIES_RALTS] = gMonIcon_Ralts,
    [SPECIES_KIRLIA] = gMonIcon_Kirlia,
    [SPECIES_GARDEVOIR] = gMonIcon_Gardevoir,
    [SPECIES_BAGON] = gMonIcon_Bagon,
    [SPECIES_SHELGON] = gMonIcon_Shelgon,
    [SPECIES_SALAMENCE] = gMonIcon_Salamence,
    [SPECIES_BELDUM] = gMonIcon_Beldum,
    [SPECIES_METANG] = gMonIcon_Metang,
    [SPECIES_METAGROSS] = gMonIcon_Metagross,
    [SPECIES_REGIROCK] = gMonIcon_Regirock,
    [SPECIES_REGICE] = gMonIcon_Regice,
    [SPECIES_REGISTEEL] = gMonIcon_Registeel,
    [SPECIES_KYOGRE] = gMonIcon_Kyogre,
    [SPECIES_GROUDON] = gMonIcon_Groudon,
    [SPECIES_RAYQUAZA] = gMonIcon_Rayquaza,
    [SPECIES_LATIAS] = gMonIcon_Latias,
    [SPECIES_LATIOS] = gMonIcon_Latios,
    [SPECIES_JIRACHI] = gMonIcon_Jirachi,
    [SPECIES_DEOXYS] = gMonIcon_Deoxys,
    [SPECIES_CHIMECHO] = gMonIcon_Chimecho,
    [SPECIES_TURTWIG] = gMonIcon_Turtwig,
    [SPECIES_GROTLE] = gMonIcon_Grotle,
    [SPECIES_TORTERRA] = gMonIcon_Torterra,
    [SPECIES_CHIMCHAR] = gMonIcon_Chimchar,
    [SPECIES_MONFERNO] = gMonIcon_Monferno,
    [SPECIES_INFERNAPE] = gMonIcon_Infernape,
    [SPECIES_PIPLUP] = gMonIcon_Piplup,
    [SPECIES_PRINPLUP] = gMonIcon_Prinplup,
    [SPECIES_EMPOLEON] = gMonIcon_Empoleon,
    [SPECIES_STARLY] = gMonIcon_Starly,
    [SPECIES_STARAVIA] = gMonIcon_Staravia,
    [SPECIES_STARAPTOR] = gMonIcon_Staraptor,
    [SPECIES_BIDOOF] = gMonIcon_Bidoof,
    [SPECIES_BIBAREL] = gMonIcon_Bibarel,
    [SPECIES_KRICKETOT] = gMonIcon_Kricketot,
    [SPECIES_KRICKETUNE] = gMonIcon_Kricketune,
    [SPECIES_SHINX] = gMonIcon_Shinx,
    [SPECIES_LUXIO] = gMonIcon_Luxio,
    [SPECIES_LUXRAY] = gMonIcon_Luxray,
    [SPECIES_BUDEW] = gMonIcon_Budew,
    [SPECIES_ROSERADE] = gMonIcon_Roserade,
    [SPECIES_CRANIDOS] = gMonIcon_Cranidos,
    [SPECIES_RAMPARDOS] = gMonIcon_Rampardos,
    [SPECIES_SHIELDON] = gMonIcon_Shieldon,
    [SPECIES_BASTIODON] = gMonIcon_Bastiodon,
    [SPECIES_BURMY] = gMonIcon_BurmyPlant,
    [SPECIES_BURMY_SANDY] = gMonIcon_BurmySandy,
    [SPECIES_BURMY_TRASH] = gMonIcon_BurmyTrash,
    [SPECIES_WORMADAM] = gMonIcon_WormadamPlant,
    [SPECIES_WORMADAM_SANDY] = gMonIcon_WormadamSandy,
    [SPECIES_WORMADAM_TRASH] = gMonIcon_WormadamTrash,
    [SPECIES_MOTHIM] = gMonIcon_Mothim,
    [SPECIES_COMBEE] = gMonIcon_Combee,
    [SPECIES_VESPIQUEN] = gMonIcon_Vespiquen,
    [SPECIES_PACHIRISU] = gMonIcon_Pachirisu,
    [SPECIES_BUIZEL] = gMonIcon_Buizel,
    [SPECIES_FLOATZEL] = gMonIcon_Floatzel,
    [SPECIES_CHERUBI] = gMonIcon_Cherubi,
    [SPECIES_CHERRIM] = gMonIcon_Cherrim,
    [SPECIES_SHELLOS] = gMonIcon_Shellos,
    [SPECIES_GASTRODON] = gMonIcon_Gastrodon,
    [SPECIES_AMBIPOM] = gMonIcon_Ambipom,
    [SPECIES_DRIFLOON] = gMonIcon_Drifloon,
    [SPECIES_DRIFBLIM] = gMonIcon_Drifblim,
    [SPECIES_BUNEARY] = gMonIcon_Buneary,
    [SPECIES_LOPUNNY] = gMonIcon_Lopunny,
    [SPECIES_MISMAGIUS] = gMonIcon_Mismagius,
    [SPECIES_HONCHKROW] = gMonIcon_Honchkrow,
    [SPECIES_GLAMEOW] = gMonIcon_Glameow,
    [SPECIES_PURUGLY] = gMonIcon_Purugly,
    [SPECIES_CHINGLING] = gMonIcon_Chingling,
    [SPECIES_STUNKY] = gMonIcon_Stunky,
    [SPECIES_SKUNTANK] = gMonIcon_Skuntank,
    [SPECIES_BRONZOR] = gMonIcon_Bronzor,
    [SPECIES_BRONZONG] = gMonIcon_Bronzong,
    [SPECIES_BONSLY] = gMonIcon_Bonsly,
    [SPECIES_MIMEJR] = gMonIcon_Mimejr,
    [SPECIES_HAPPINY] = gMonIcon_Happiny,
    [SPECIES_CHATOT] = gMonIcon_Chatot,
    [SPECIES_SPIRITOMB] = gMonIcon_Spiritomb,
    [SPECIES_GIBLE] = gMonIcon_Gible,
    [SPECIES_GABITE] = gMonIcon_Gabite,
    [SPECIES_GARCHOMP] = gMonIcon_Garchomp,
    [SPECIES_MUNCHLAX] = gMonIcon_Munchlax,
    [SPECIES_RIOLU] = gMonIcon_Riolu,
    [SPECIES_LUCARIO] = gMonIcon_Lucario,
    [SPECIES_HIPPOPOTAS] = gMonIcon_Hippopotas,
    [SPECIES_HIPPOWDON] = gMonIcon_Hippowdon,
    [SPECIES_SKORUPI] = gMonIcon_Skorupi,
    [SPECIES_DRAPION] = gMonIcon_Drapion,
    [SPECIES_CROAGUNK] = gMonIcon_Croagunk,
    [SPECIES_TOXICROAK] = gMonIcon_Toxicroak,
    [SPECIES_CARNIVINE] = gMonIcon_Carnivine,
    [SPECIES_FINNEON] = gMonIcon_Finneon,
    [SPECIES_LUMINEON] = gMonIcon_Lumineon,
    [SPECIES_MANTYKE] = gMonIcon_Mantyke,
    [SPECIES_SNOVER] = gMonIcon_Snover,
    [SPECIES_ABOMASNOW] = gMonIcon_Abomasnow,
    [SPECIES_WEAVILE] = gMonIcon_Weavile,
    [SPECIES_MAGNEZONE] = gMonIcon_Magnezone,
    [SPECIES_LICKILICKY] = gMonIcon_Lickilicky,
    [SPECIES_RHYPERIOR] = gMonIcon_Rhyperior,
    [SPECIES_TANGROWTH] = gMonIcon_Tangrowth,
    [SPECIES_ELECTIVIRE] = gMonIcon_Electivire,
    [SPECIES_MAGMORTAR] = gMonIcon_Magmortar,
    [SPECIES_TOGEKISS] = gMonIcon_Togekiss,
    [SPECIES_YANMEGA] = gMonIcon_Yanmega,
    [SPECIES_LEAFEON] = gMonIcon_Leafeon,
    [SPECIES_GLACEON] = gMonIcon_Glaceon,
    [SPECIES_GLISCOR] = gMonIcon_Gliscor,
    [SPECIES_MAMOSWINE] = gMonIcon_Mamoswine,
    [SPECIES_PORYGON_Z] = gMonIcon_Porygon_Z,
    [SPECIES_GALLADE] = gMonIcon_Gallade,
    [SPECIES_PROBOPASS] = gMonIcon_Probopass,
    [SPECIES_DUSKNOIR] = gMonIcon_Dusknoir,
    [SPECIES_FROSLASS] = gMonIcon_Froslass,
    [SPECIES_ROTOM] = gMonIcon_Rotom,
    [SPECIES_UXIE] = gMonIcon_Uxie,
    [SPECIES_MESPRIT] = gMonIcon_Mesprit,
    [SPECIES_AZELF] = gMonIcon_Azelf,
    [SPECIES_DIALGA] = gMonIcon_Dialga,
    [SPECIES_PALKIA] = gMonIcon_Palkia,
    [SPECIES_HEATRAN] = gMonIcon_Heatran,
    [SPECIES_REGIGIGAS] = gMonIcon_Regigigas,
    [SPECIES_GIRATINA] = gMonIcon_Giratina,
    [SPECIES_CRESSELIA] = gMonIcon_Cresselia,
    [SPECIES_PHIONE] = gMonIcon_Phione,
    [SPECIES_MANAPHY] = gMonIcon_Manaphy,
    [SPECIES_DARKRAI] = gMonIcon_Darkrai,
    [SPECIES_SHAYMIN] = gMonIcon_Shaymin,
    [SPECIES_ARCEUS] = gMonIcon_Arceus,
	[SPECIES_VICTINI] = gMonIcon_Victini,
	[SPECIES_SNIVY] = gMonIcon_Snivy,
	[SPECIES_SERVINE] = gMonIcon_Servine,
	[SPECIES_SERPERIOR] = gMonIcon_Serperior,
	[SPECIES_TEPIG] = gMonIcon_Tepig,
	[SPECIES_PIGNITE] = gMonIcon_Pignite,
	[SPECIES_EMBOAR] = gMonIcon_Emboar,
	[SPECIES_OSHAWOTT] = gMonIcon_Oshawott,
	[SPECIES_DEWOTT] = gMonIcon_Dewott,
	[SPECIES_SAMUROTT] = gMonIcon_Samurott,
	[SPECIES_PATRAT] = gMonIcon_Patrat,
	[SPECIES_WATCHOG] = gMonIcon_Watchog,
	[SPECIES_LILLIPUP] = gMonIcon_Lillipup,
	[SPECIES_HERDIER] = gMonIcon_Herdier,
	[SPECIES_STOUTLAND] = gMonIcon_Stoutland,
	[SPECIES_PURRLOIN] = gMonIcon_Purrloin,
	[SPECIES_LIEPARD] = gMonIcon_Liepard,
	[SPECIES_PANSAGE] = gMonIcon_Pansage,
	[SPECIES_SIMISAGE] = gMonIcon_Simisage,
	[SPECIES_PANSEAR] = gMonIcon_Pansear,
	[SPECIES_SIMISEAR] = gMonIcon_Simisear,
	[SPECIES_PANPOUR] = gMonIcon_Panpour,
	[SPECIES_SIMIPOUR] = gMonIcon_Simipour,
	[SPECIES_MUNNA] = gMonIcon_Munna,
	[SPECIES_MUSHARNA] = gMonIcon_Musharna,
	[SPECIES_PIDOVE] = gMonIcon_Pidove,
	[SPECIES_TRANQUILL] = gMonIcon_Tranquill,
	[SPECIES_UNFEZANT] = gMonIcon_Unfezant,
	[SPECIES_BLITZLE] = gMonIcon_Blitzle,
	[SPECIES_ZEBSTRIKA] = gMonIcon_Zebstrika,
	[SPECIES_ROGGENROLA] = gMonIcon_Roggenrola,
	[SPECIES_BOLDORE] = gMonIcon_Boldore,
	[SPECIES_GIGALITH] = gMonIcon_Gigalith,
	[SPECIES_WOOBAT] = gMonIcon_Woobat,
	[SPECIES_SWOOBAT] = gMonIcon_Swoobat,
	[SPECIES_DRILBUR] = gMonIcon_Drilbur,
	[SPECIES_EXCADRILL] = gMonIcon_Excadrill,
	[SPECIES_AUDINO] = gMonIcon_Audino,
	[SPECIES_TIMBURR] = gMonIcon_Timburr,
	[SPECIES_GURDURR] = gMonIcon_Gurdurr,
	[SPECIES_CONKELDURR] = gMonIcon_Conkeldurr,
	[SPECIES_TYMPOLE] = gMonIcon_Tympole,
	[SPECIES_PALPITOAD] = gMonIcon_Palpitoad,
	[SPECIES_SEISMITOAD] = gMonIcon_Seismitoad,
	[SPECIES_THROH] = gMonIcon_Throh,
	[SPECIES_SAWK] = gMonIcon_Sawk,
	[SPECIES_SEWADDLE] = gMonIcon_Sewaddle,
	[SPECIES_SWADLOON] = gMonIcon_Swadloon,
	[SPECIES_LEAVANNY] = gMonIcon_Leavanny,
	[SPECIES_VENIPEDE] = gMonIcon_Venipede,
	[SPECIES_WHIRLIPEDE] = gMonIcon_Whirlipede,
	[SPECIES_SCOLIPEDE] = gMonIcon_Scolipede,
	[SPECIES_COTTONEE] = gMonIcon_Cottonee,
	[SPECIES_WHIMSICOTT] = gMonIcon_Whimsicott,
	[SPECIES_PETILIL] = gMonIcon_Petilil,
	[SPECIES_LILLIGANT] = gMonIcon_Lilligant,
	[SPECIES_BASCULIN] = gMonIcon_Basculin,
	[SPECIES_SANDILE] = gMonIcon_Sandile,
	[SPECIES_KROKOROK] = gMonIcon_Krokorok,
	[SPECIES_KROOKODILE] = gMonIcon_Krookodile,
	[SPECIES_DARUMAKA] = gMonIcon_Darumaka,
	[SPECIES_DARMANITAN] = gMonIcon_Darmanitan,
	[SPECIES_MARACTUS] = gMonIcon_Maractus,
	[SPECIES_DWEBBLE] = gMonIcon_Dwebble,
	[SPECIES_CRUSTLE] = gMonIcon_Crustle,
	[SPECIES_SCRAGGY] = gMonIcon_Scraggy,
	[SPECIES_SCRAFTY] = gMonIcon_Scrafty,
	[SPECIES_SIGILYPH] = gMonIcon_Sigilyph,
	[SPECIES_YAMASK] = gMonIcon_Yamask,
	[SPECIES_COFAGRIGUS] = gMonIcon_Cofagrigus,
	[SPECIES_TIRTOUGA] = gMonIcon_Tirtouga,
	[SPECIES_CARRACOSTA] = gMonIcon_Carracosta,
	[SPECIES_ARCHEN] = gMonIcon_Archen,
	[SPECIES_ARCHEOPS] = gMonIcon_Archeops,
	[SPECIES_TRUBBISH] = gMonIcon_Trubbish,
	[SPECIES_GARBODOR] = gMonIcon_Garbodor,
	[SPECIES_ZORUA] = gMonIcon_Zorua,
	[SPECIES_ZOROARK] = gMonIcon_Zoroark,
	[SPECIES_MINCCINO] = gMonIcon_Minccino,
	[SPECIES_CINCCINO] = gMonIcon_Cinccino,
	[SPECIES_GOTHITA] = gMonIcon_Gothita,
	[SPECIES_GOTHORITA] = gMonIcon_Gothorita,
	[SPECIES_GOTHITELLE] = gMonIcon_Gothitelle,
	[SPECIES_SOLOSIS] = gMonIcon_Solosis,
	[SPECIES_DUOSION] = gMonIcon_Duosion,
	[SPECIES_REUNICLUS] = gMonIcon_Reuniclus,
	[SPECIES_DUCKLETT] = gMonIcon_Ducklett,
	[SPECIES_SWANNA] = gMonIcon_Swanna,
	[SPECIES_VANILLITE] = gMonIcon_Vanillite,
	[SPECIES_VANILLISH] = gMonIcon_Vanillish,
	[SPECIES_VANILLUXE] = gMonIcon_Vanilluxe,
	[SPECIES_DEERLING] = gMonIcon_Deerling,
	[SPECIES_SAWSBUCK] = gMonIcon_Sawsbuck,
	[SPECIES_EMOLGA] = gMonIcon_Emolga,
	[SPECIES_KARRABLAST] = gMonIcon_Karrablast,
	[SPECIES_ESCAVALIER] = gMonIcon_Escavalier,
	[SPECIES_FOONGUS] = gMonIcon_Foongus,
	[SPECIES_AMOONGUSS] = gMonIcon_Amoonguss,
	[SPECIES_FRILLISH] = gMonIcon_Frillish,
	[SPECIES_JELLICENT] = gMonIcon_Jellicent,
	[SPECIES_ALOMOMOLA] = gMonIcon_Alomomola,
	[SPECIES_JOLTIK] = gMonIcon_Joltik,
	[SPECIES_GALVANTULA] = gMonIcon_Galvantula,
	[SPECIES_FERROSEED] = gMonIcon_Ferroseed,
	[SPECIES_FERROTHORN] = gMonIcon_Ferrothorn,
	[SPECIES_KLINK] = gMonIcon_Klink,
	[SPECIES_KLANG] = gMonIcon_Klang,
	[SPECIES_KLINKLANG] = gMonIcon_Klinklang,
	[SPECIES_TYNAMO] = gMonIcon_Tynamo,
	[SPECIES_EELEKTRIK] = gMonIcon_Eelektrik,
	[SPECIES_EELEKTROSS] = gMonIcon_Eelektross,
	[SPECIES_ELGYEM] = gMonIcon_Elgyem,
	[SPECIES_BEHEEYEM] = gMonIcon_Beheeyem,
	[SPECIES_LITWICK] = gMonIcon_Litwick,
	[SPECIES_LAMPENT] = gMonIcon_Lampent,
	[SPECIES_CHANDELURE] = gMonIcon_Chandelure,
	[SPECIES_AXEW] = gMonIcon_Axew,
	[SPECIES_FRAXURE] = gMonIcon_Fraxure,
	[SPECIES_HAXORUS] = gMonIcon_Haxorus,
	[SPECIES_CUBCHOO] = gMonIcon_Cubchoo,
	[SPECIES_BEARTIC] = gMonIcon_Beartic,
	[SPECIES_CRYOGONAL] = gMonIcon_Cryogonal,
	[SPECIES_SHELMET] = gMonIcon_Shelmet,
	[SPECIES_ACCELGOR] = gMonIcon_Accelgor,
	[SPECIES_STUNFISK] = gMonIcon_Stunfisk,
	[SPECIES_MIENFOO] = gMonIcon_Mienfoo,
	[SPECIES_MIENSHAO] = gMonIcon_Mienshao,
	[SPECIES_DRUDDIGON] = gMonIcon_Druddigon,
	[SPECIES_GOLETT] = gMonIcon_Golett,
	[SPECIES_GOLURK] = gMonIcon_Golurk,
	[SPECIES_PAWNIARD] = gMonIcon_Pawniard,
	[SPECIES_BISHARP] = gMonIcon_Bisharp,
	[SPECIES_BOUFFALANT] = gMonIcon_Bouffalant,
	[SPECIES_RUFFLET] = gMonIcon_Rufflet,
	[SPECIES_BRAVIARY] = gMonIcon_Braviary,
	[SPECIES_VULLABY] = gMonIcon_Vullaby,
	[SPECIES_MANDIBUZZ] = gMonIcon_Mandibuzz,
	[SPECIES_HEATMOR] = gMonIcon_Heatmor,
	[SPECIES_DURANT] = gMonIcon_Durant,
	[SPECIES_DEINO] = gMonIcon_Deino,
	[SPECIES_ZWEILOUS] = gMonIcon_Zweilous,
	[SPECIES_HYDREIGON] = gMonIcon_Hydreigon,
	[SPECIES_LARVESTA] = gMonIcon_Larvesta,
	[SPECIES_VOLCARONA] = gMonIcon_Volcarona,
	[SPECIES_COBALION] = gMonIcon_Cobalion,
	[SPECIES_TERRAKION] = gMonIcon_Terrakion,
	[SPECIES_VIRIZION] = gMonIcon_Virizion,
	[SPECIES_TORNADUS] = gMonIcon_Tornadus,
	[SPECIES_THUNDURUS] = gMonIcon_Thundurus,
	[SPECIES_RESHIRAM] = gMonIcon_Reshiram,
	[SPECIES_ZEKROM] = gMonIcon_Zekrom,
	[SPECIES_LANDORUS] = gMonIcon_Landorus,
	[SPECIES_KYUREM] = gMonIcon_Kyurem,
	[SPECIES_KELDEO] = gMonIcon_Keldeo,
	[SPECIES_MELOETTA] = gMonIcon_Meloetta,
	[SPECIES_GENESECT] = gMonIcon_Genesect,
	[SPECIES_ROWLET] = gMonIcon_Rowlet,
	[SPECIES_DARTRIX] = gMonIcon_Dartrix,
	[SPECIES_DECIDUEYE] = gMonIcon_Decidueye,
	[SPECIES_LITTEN] = gMonIcon_Litten,
	[SPECIES_TORRACAT] = gMonIcon_Torracat,
	[SPECIES_INCINEROAR] = gMonIcon_Incineroar,
	[SPECIES_POPPLIO] = gMonIcon_Popplio,
	[SPECIES_BRIONNE] = gMonIcon_Brionne,
	[SPECIES_PRIMARINA] = gMonIcon_Primarina,
	[SPECIES_PIKIPEK] = gMonIcon_Pikipek,
	[SPECIES_TRUMBEAK] = gMonIcon_Trumbeak,
	[SPECIES_TOUCANNON] = gMonIcon_Toucannon,
	[SPECIES_YUNGOOS] = gMonIcon_Yungoos,
	[SPECIES_GUMSHOOS] = gMonIcon_Gumshoos,
	[SPECIES_GRUBBIN] = gMonIcon_Grubbin,
	[SPECIES_CHARJABUG] = gMonIcon_Charjabug,
	[SPECIES_VIKAVOLT] = gMonIcon_Vikavolt,
	[SPECIES_CRABRAWLER] = gMonIcon_Crabrawler,
	[SPECIES_CRABOMINABLE] = gMonIcon_Crabominable,
	[SPECIES_ORICORIO] = gMonIcon_Oricorio,
	[SPECIES_CUTIEFLY] = gMonIcon_Cutiefly,
	[SPECIES_RIBOMBEE] = gMonIcon_Ribombee,
	[SPECIES_ROCKRUFF] = gMonIcon_Rockruff,
	[SPECIES_LYCANROC] = gMonIcon_Lycanroc,
	[SPECIES_WISHIWASHI] = gMonIcon_Wishiwashi,
	[SPECIES_MAREANIE] = gMonIcon_Mareanie,
	[SPECIES_TOXAPEX] = gMonIcon_Toxapex,
	[SPECIES_MUDBRAY] = gMonIcon_Mudbray,
	[SPECIES_MUDSDALE] = gMonIcon_Mudsdale,
	[SPECIES_DEWPIDER] = gMonIcon_Dewpider,
	[SPECIES_ARAQUANID] = gMonIcon_Araquanid,
	[SPECIES_FOMANTIS] = gMonIcon_Fomantis,
	[SPECIES_LURANTIS] = gMonIcon_Lurantis,
	[SPECIES_MORELULL] = gMonIcon_Morelull,
	[SPECIES_SHIINOTIC] = gMonIcon_Shiinotic,
	[SPECIES_SALANDIT] = gMonIcon_Salandit,
	[SPECIES_SALAZZLE] = gMonIcon_Salazzle,
	[SPECIES_STUFFUL] = gMonIcon_Stufful,
	[SPECIES_BEWEAR] = gMonIcon_Bewear,
	[SPECIES_BOUNSWEET] = gMonIcon_Bounsweet,
	[SPECIES_STEENEE] = gMonIcon_Steenee,
	[SPECIES_TSAREENA] = gMonIcon_Tsareena,
	[SPECIES_COMFEY] = gMonIcon_Comfey,
	[SPECIES_ORANGURU] = gMonIcon_Oranguru,
	[SPECIES_PASSIMIAN] = gMonIcon_Passimian,
	[SPECIES_WIMPOD] = gMonIcon_Wimpod,
	[SPECIES_GOLISOPOD] = gMonIcon_Golisopod,
	[SPECIES_SANDYGAST] = gMonIcon_Sandygast,
	[SPECIES_PALOSSAND] = gMonIcon_Palossand,
	[SPECIES_PYUKUMUKU] = gMonIcon_Pyukumuku,
	[SPECIES_TYPE_NULL] = gMonIcon_Type_null,
	[SPECIES_SILVALLY] = gMonIcon_Silvally,
	[SPECIES_MINIOR] = gMonIcon_Minior,
	[SPECIES_KOMALA] = gMonIcon_Komala,
	[SPECIES_TURTONATOR] = gMonIcon_Turtonator,
	[SPECIES_TOGEDEMARU] = gMonIcon_Togedemaru,
	[SPECIES_MIMIKYU] = gMonIcon_Mimikyu,
	[SPECIES_BRUXISH] = gMonIcon_Bruxish,
	[SPECIES_DRAMPA] = gMonIcon_Drampa,
	[SPECIES_DHELMISE] = gMonIcon_Dhelmise,
	[SPECIES_JANGMO_O] = gMonIcon_Jangmo_o,
	[SPECIES_HAKAMO_O] = gMonIcon_Hakamo_o,
	[SPECIES_KOMMO_O] = gMonIcon_Kommo_o,
	[SPECIES_TAPU_KOKO] = gMonIcon_Tapu_koko,
	[SPECIES_TAPU_LELE] = gMonIcon_Tapu_lele,
	[SPECIES_TAPU_BULU] = gMonIcon_Tapu_bulu,
	[SPECIES_TAPU_FINI] = gMonIcon_Tapu_fini,
	[SPECIES_COSMOG] = gMonIcon_Cosmog,
	[SPECIES_COSMOEM] = gMonIcon_Cosmoem,
	[SPECIES_SOLGALEO] = gMonIcon_Solgaleo,
	[SPECIES_LUNALA] = gMonIcon_Lunala,
	[SPECIES_NIHILEGO] = gMonIcon_Nihilego,
	[SPECIES_BUZZWOLE] = gMonIcon_Buzzwole,
	[SPECIES_PHEROMOSA] = gMonIcon_Pheromosa,
	[SPECIES_XURKITREE] = gMonIcon_Xurkitree,
	[SPECIES_CELESTEELA] = gMonIcon_Celesteela,
	[SPECIES_KARTANA] = gMonIcon_Kartana,
	[SPECIES_GUZZLORD] = gMonIcon_Guzzlord,
	[SPECIES_NECROZMA] = gMonIcon_Necrozma,
	[SPECIES_MAGEARNA] = gMonIcon_Magearna,
	[SPECIES_MARSHADOW] = gMonIcon_Marshadow,
	[SPECIES_POIPOLE] = gMonIcon_Poipole,
	[SPECIES_NAGANADEL] = gMonIcon_Naganadel,
	[SPECIES_STAKATAKA] = gMonIcon_Stakataka,
	[SPECIES_BLACEPHALON] = gMonIcon_Blacephalon,
	[SPECIES_ZERAORA] = gMonIcon_Zeraora,
    [SPECIES_EGG] = gMonIcon_Egg,
    [SPECIES_UNOWN_A] = gMonIcon_UnownA,
    [SPECIES_UNOWN_B] = gMonIcon_UnownB,
    [SPECIES_UNOWN_C] = gMonIcon_UnownC,
    [SPECIES_UNOWN_D] = gMonIcon_UnownD,
    [SPECIES_UNOWN_E] = gMonIcon_UnownE,
    [SPECIES_UNOWN_F] = gMonIcon_UnownF,
    [SPECIES_UNOWN_G] = gMonIcon_UnownG,
    [SPECIES_UNOWN_H] = gMonIcon_UnownH,
    [SPECIES_UNOWN_I] = gMonIcon_UnownI,
    [SPECIES_UNOWN_J] = gMonIcon_UnownJ,
    [SPECIES_UNOWN_K] = gMonIcon_UnownK,
    [SPECIES_UNOWN_L] = gMonIcon_UnownL,
    [SPECIES_UNOWN_M] = gMonIcon_UnownM,
    [SPECIES_UNOWN_N] = gMonIcon_UnownN,
    [SPECIES_UNOWN_O] = gMonIcon_UnownO,
    [SPECIES_UNOWN_P] = gMonIcon_UnownP,
    [SPECIES_UNOWN_Q] = gMonIcon_UnownQ,
    [SPECIES_UNOWN_R] = gMonIcon_UnownR,
    [SPECIES_UNOWN_S] = gMonIcon_UnownS,
    [SPECIES_UNOWN_T] = gMonIcon_UnownT,
    [SPECIES_UNOWN_U] = gMonIcon_UnownU,
    [SPECIES_UNOWN_V] = gMonIcon_UnownV,
    [SPECIES_UNOWN_W] = gMonIcon_UnownW,
    [SPECIES_UNOWN_X] = gMonIcon_UnownX,
    [SPECIES_UNOWN_Y] = gMonIcon_UnownY,
    [SPECIES_UNOWN_Z] = gMonIcon_UnownZ,
    [SPECIES_UNOWN_EMARK] = gMonIcon_UnownExclamationMark,
    [SPECIES_UNOWN_QMARK] = gMonIcon_UnownQuestionMark,

};

const u8 gMonIconPaletteIndices[] =
{
    [0 ... SPECIES_EGG] = 1,
    [SPECIES_UNOWN_A ... SPECIES_UNOWN_QMARK] = 0,
};

const struct SpritePalette gMonIconPaletteTable[] =
{
    { gMonIconPalettes[0], POKE_ICON_BASE_PAL_TAG + 0 },
    { gMonIconPalettes[1], POKE_ICON_BASE_PAL_TAG + 1 },
    { gMonIconPalettes[2], POKE_ICON_BASE_PAL_TAG + 2 },

// There are only 3 actual palettes. The following are unused
// and don't point to valid data.
    { gMonIconPalettes[3], POKE_ICON_BASE_PAL_TAG + 3 },
    { gMonIconPalettes[4], POKE_ICON_BASE_PAL_TAG + 4 },
    { gMonIconPalettes[5], POKE_ICON_BASE_PAL_TAG + 5 },
};

const struct OamData sMonIconOamData =
{
    .y = 0,
    .affineMode = ST_OAM_AFFINE_OFF,
    .objMode = ST_OAM_OBJ_NORMAL,
    .bpp = ST_OAM_4BPP,
    .shape = SPRITE_SHAPE(32x32),
    .x = 0,
    .size = SPRITE_SIZE(32x32),
    .tileNum = 0,
    .priority = 1,
    .paletteNum = 0,
};

// fastest to slowest

static const union AnimCmd sAnim_0[] =
{
    ANIMCMD_FRAME(0, 6),
    ANIMCMD_FRAME(1, 6),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_1[] =
{
    ANIMCMD_FRAME(0, 8),
    ANIMCMD_FRAME(1, 8),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_2[] =
{
    ANIMCMD_FRAME(0, 14),
    ANIMCMD_FRAME(1, 14),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_3[] =
{
    ANIMCMD_FRAME(0, 22),
    ANIMCMD_FRAME(1, 22),
    ANIMCMD_JUMP(0),
};

static const union AnimCmd sAnim_4[] =
{
    ANIMCMD_FRAME(0, 29),
    ANIMCMD_FRAME(0, 29), // frame 0 is repeated
    ANIMCMD_JUMP(0),
};

const union AnimCmd *const sMonIconAnims[] =
{
    sAnim_0,
    sAnim_1,
    sAnim_2,
    sAnim_3,
    sAnim_4,
};

static const union AffineAnimCmd sAffineAnim_0[] =
{
    AFFINEANIMCMD_FRAME(0, 0, 0, 10),
    AFFINEANIMCMD_END,
};

static const union AffineAnimCmd sAffineAnim_1[] =
{
    AFFINEANIMCMD_FRAME(-2, -2, 0, 122),
    AFFINEANIMCMD_END,
};

const union AffineAnimCmd *const sMonIconAffineAnims[] =
{
    sAffineAnim_0,
    sAffineAnim_1,
};

const u16 sSpriteImageSizes[3][4] =
{
    // square
    {
         0x20, // 1×1
         0x80, // 2×2
        0x200, // 4×4
        0x800, // 8×8
    },

    // horizontal rectangle
    {
         0x40, // 2×1
         0x80, // 4×1
        0x100, // 4×2
        0x400, // 8×4
    },

    // vertical rectangle
    {
         0x40, // 1×2
         0x80, // 1×4
        0x100, // 2×4
        0x400, // 4×8
    },
};

u8 CreateMonIcon(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority, u32 personality, bool32 extra)
{
    u8 spriteId;
    struct MonIconSpriteTemplate iconTemplate =
    {
        .oam = &sMonIconOamData,
        .image = GetMonIconPtr(species, personality, extra),
        .anims = sMonIconAnims,
        .affineAnims = sMonIconAffineAnims,
        .callback = callback,
        .paletteTag = POKE_ICON_BASE_PAL_TAG + gMonIconPaletteIndices[species],
    };

    if (species > NUM_SPECIES)
        iconTemplate.paletteTag = POKE_ICON_BASE_PAL_TAG;

    spriteId = CreateMonIconSprite(&iconTemplate, x, y, subpriority);

    UpdateMonIconFrame(&gSprites[spriteId]);

    return spriteId;
}

u8 sub_80D2D78(u16 species, void (*callback)(struct Sprite *), s16 x, s16 y, u8 subpriority, bool32 extra)
{
    u8 spriteId;
    struct MonIconSpriteTemplate iconTemplate =
    {
        .oam = &sMonIconOamData,
        .image = NULL,
        .anims = sMonIconAnims,
        .affineAnims = sMonIconAffineAnims,
        .callback = callback,
        .paletteTag = POKE_ICON_BASE_PAL_TAG + gMonIconPaletteIndices[species],
    };

    iconTemplate.image = GetMonIconTiles(species, extra);
    spriteId = CreateMonIconSprite(&iconTemplate, x, y, subpriority);

    UpdateMonIconFrame(&gSprites[spriteId]);

    return spriteId;
}

u16 GetIconSpecies(u16 species, u32 personality)
{
    u16 result;

    if (species == SPECIES_UNOWN)
    {
        result = GetUnownSpeciesId(personality);
    }
    else
    {
        if (species > NUM_SPECIES)
            result = 260;
        else
            result = species;
    }

    return result;
}

u16 GetUnownLetterByPersonality(u32 personality)
{
    if (!personality)
        return 0;
    else
        return (((personality & 0x3000000) >> 18) | ((personality & 0x30000) >> 12) | ((personality & 0x300) >> 6) | (personality & 0x3)) % 0x1C;
}

u16 sub_80D2E84(u16 species)
{
    u16 value;

    if (MailSpeciesToSpecies(species, &value) == SPECIES_UNOWN)
    {
        value += SPECIES_UNOWN_A;
        return value;
    }
    else
    {
        if (species > NUM_SPECIES)
            species = 0;

        return GetIconSpecies(species, 0);
    }
}

const u8 *GetMonIconPtr(u16 species, u32 personality, bool32 extra)
{
    return GetMonIconTiles(GetIconSpecies(species, personality), extra);
}

void sub_80D2EF8(struct Sprite *sprite)
{
    sub_80D328C(sprite);
}

void LoadMonIconPalettes(void)
{
    u8 i;
    for (i = 0; i < ARRAY_COUNT(gMonIconPaletteTable); i++)
        LoadSpritePalette(&gMonIconPaletteTable[i]);
}

// unused
void SafeLoadMonIconPalette(u16 species)
{
    u8 palIndex;
    if (species > NUM_SPECIES)
        species = 260;
    palIndex = gMonIconPaletteIndices[species];
    if (IndexOfSpritePaletteTag(gMonIconPaletteTable[palIndex].tag) == 0xFF)
        LoadSpritePalette(&gMonIconPaletteTable[palIndex]);
}

void LoadMonIconPalette(u16 species)
{
    u8 palIndex = gMonIconPaletteIndices[species];
    if (IndexOfSpritePaletteTag(gMonIconPaletteTable[palIndex].tag) == 0xFF)
        LoadSpritePalette(&gMonIconPaletteTable[palIndex]);
}

void FreeMonIconPalettes(void)
{
    u8 i;
    for (i = 0; i < 6; i++)
        FreeSpritePaletteByTag(gMonIconPaletteTable[i].tag);
}

// unused
void SafeFreeMonIconPalette(u16 species)
{
    u8 palIndex;
    if (species > NUM_SPECIES)
        species = 260;
    palIndex = gMonIconPaletteIndices[species];
    FreeSpritePaletteByTag(gMonIconPaletteTable[palIndex].tag);
}

void FreeMonIconPalette(u16 species)
{
    u8 palIndex;
    palIndex = gMonIconPaletteIndices[species];
    FreeSpritePaletteByTag(gMonIconPaletteTable[palIndex].tag);
}

void sub_80D3014(struct Sprite *sprite)
{
    UpdateMonIconFrame(sprite);
}

const u8* GetMonIconTiles(u16 species, bool32 extra)
{
    const u8* iconSprite = gMonIconTable[species];
    if (species == SPECIES_DEOXYS && extra == TRUE)
    {
        iconSprite = (const u8*)(0x400 + (u32)iconSprite); //WTF?
    }
    return iconSprite;
}

void sub_80D304C(u16 offset)
{
    s32 i;
    const struct SpritePalette* monIconPalettePtr;

    if (offset <= 0xA0)
    {
        monIconPalettePtr = gMonIconPaletteTable;
        for(i = 5; i >= 0; i--)
        {
            LoadPalette(monIconPalettePtr->data, offset, 0x20);
            offset += 0x10;
            monIconPalettePtr++;
        }
    }
}

u8 GetValidMonIconPalIndex(u16 species)
{
    if (species > NUM_SPECIES)
        species = 260;
    return gMonIconPaletteIndices[species];
}

u8 sub_80D30A0(u16 species)
{
    return gMonIconPaletteIndices[species];
}

const u16* GetValidMonIconPalettePtr(u16 species)
{
    if (species > NUM_SPECIES)
        species = 260;
    return gMonIconPaletteTable[gMonIconPaletteIndices[species]].data;
}

u8 UpdateMonIconFrame(struct Sprite *sprite)
{
    u8 result = 0;

    if (sprite->animDelayCounter == 0)
    {
        s16 frame = sprite->anims[sprite->animNum][sprite->animCmdIndex].frame.imageValue;

        switch (frame)
        {
        case -1:
            break;
        case -2:
            sprite->animCmdIndex = 0;
            break;
        default:
            RequestSpriteCopy(
                // pointer arithmetic is needed to get the correct pointer to perform the sprite copy on.
                // because sprite->images is a struct def, it has to be casted to (u8 *) before any
                // arithmetic can be performed.
                (u8 *)sprite->images + (sSpriteImageSizes[sprite->oam.shape][sprite->oam.size] * frame),
                (u8 *)(OBJ_VRAM0 + sprite->oam.tileNum * TILE_SIZE_4BPP),
                sSpriteImageSizes[sprite->oam.shape][sprite->oam.size]);
            sprite->animDelayCounter = sprite->anims[sprite->animNum][sprite->animCmdIndex].frame.duration & 0xFF;
            sprite->animCmdIndex++;
            result = sprite->animCmdIndex;
            break;
        }
    }
    else
    {
        sprite->animDelayCounter--;
    }
    return result;
}

static u8 CreateMonIconSprite(struct MonIconSpriteTemplate *iconTemplate, s16 x, s16 y, u8 subpriority)
{
    u8 spriteId;

    struct SpriteFrameImage image = { NULL, sSpriteImageSizes[iconTemplate->oam->shape][iconTemplate->oam->size] };

    struct SpriteTemplate spriteTemplate =
    {
        .tileTag = 0xFFFF,
        .paletteTag = iconTemplate->paletteTag,
        .oam = iconTemplate->oam,
        .anims = iconTemplate->anims,
        .images = &image,
        .affineAnims = iconTemplate->affineAnims,
        .callback = iconTemplate->callback,
    };

    spriteId = CreateSprite(&spriteTemplate, x, y, subpriority);
    gSprites[spriteId].animPaused = TRUE;
    gSprites[spriteId].animBeginning = FALSE;
    gSprites[spriteId].images = (const struct SpriteFrameImage *)iconTemplate->image;
    return spriteId;
}

void sub_80D328C(struct Sprite *sprite)
{
    struct SpriteFrameImage image = { NULL, sSpriteImageSizes[sprite->oam.shape][sprite->oam.size] };
    sprite->images = &image;
    DestroySprite(sprite);
}

void sub_80D32C8(struct Sprite *sprite, u8 animNum)
{
    sprite->animNum = animNum;
    sprite->animDelayCounter = 0;
    sprite->animCmdIndex = 0;
}
