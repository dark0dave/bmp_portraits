#!/usr/bin/env bash
set -euo pipefail

declare -A npcs
npcs["aerie"]="naeriel,naeriem"
npcs["ajantis"]="ajantisl,ajantism,ajantiss"
npcs["alora"]="aloral,aloram,aloras"
npcs["anomen"]="nanomenl,nanomenm"
npcs["baeloth"]="baelothl,baelothm,baeloths"
npcs["branwen"]="branwel,branwem,branwes"
npcs["caelar"]="caelarl,caelarm,caelars"
npcs["cernd"]="ncerndl,ncerndm"
npcs["clara"]="ohhexl,ohhexm"
npcs["coran"]="coranl,coranm,corans"
npcs["corwin"]="corwinl,corwinm"
npcs["dorn"]="dornl,dornm,dorns"
npcs["dynaheir"]="dynaheil,dynaheim,dynaheis"
npcs["edwin"]="edwinl,edwinm,edwins,nedwinl,nedwinm"
npcs["eldoth"]="eldothl,eldothm,eldoths"
npcs["faldorn"]="faldornl,faldornm,faldorns"
npcs["garrick"]="garrickl,garrickm,garricks"
npcs["glint"]="glintl,glintm,glints"
npcs["haerdalis"]="nhaerl,nhaerm"
npcs["hexaat"]="ohhexxl,ohhexxm"
npcs["imeon"]="imoenl,imoenm,imoens,bdimoenl,bdimoenm,nimoenl,nimoenm,nimoens"
npcs["jaheira"]="jaheiral,jaheiram,jaheiras,jaheirl,jaheirm"
npcs["jan"]="njanl,njanm"
npcs["kagain"]="kagainl,kagainm,kagains"
npcs["keldorn"]="nkeldorl,nkeldorm"
npcs["khalid"]="khalidl,khalidm,khalids"
npcs["kivan"]="kivanl,kivanm,kivans"
npcs["korgan"]="nkorganl,nkorganm"
npcs["mazzy"]="nmazzyl,nmazzym"
npcs["minsc"]="minscl,minscm,minscs,nminscl,nminscm"
npcs["mkhilin"]="mkhiinl,mkhiinm,mkhiins"
npcs["montaron"]="montarl,montarm,montars"
npcs["nalia"]="nnalial,nnaliam"
npcs["neera"]="neeral,neeram,neeras"
npcs["quayle"]="quaylel,quaylem,quayles"
npcs["rasaad"]="rasaadl,rasaadm,rasaads"
npcs["safana"]="safanal,safanam,safanas"
npcs["sarevok"]="nsarevokl,nsarevokm"
npcs["schael"]="schaell,schaelm,schaels"
npcs["sharteel"]="shartell,shartelm,shartels"
npcs["skie"]="skiel,skiem,skies"
npcs["tiax"]="tiaxl,tiaxm,tiaxs"
npcs["valygar"]="nvalygal,nvalygam"
npcs["viconia"]="viconial,viconiam,viconias,bdviconl,bdviconm,bdvicons,nviconl,nviconm"
npcs["voghiln"]="voghilnl,voghilnm,voghilns"
npcs["wilson"]="wilsonl,wilsonm"
npcs["xan"]="xanl,xanm,xans"
npcs["xzar"]="xzarl,xzarm,xzars"
npcs["yeslick"]="yeslickl,yeslickm,yeslicks"
npcs["yoshimo"]="nyoshiml,nyoshimm"

template() {
  echo """
BEGIN ~ruvan_$1~
DESIGNATED $4
GROUP @8 /* ruvan */
LABEL ~Ruvan $1~
REQUIRE_PREDICATE GAME_IS ~bgee tob bg2ee eet~ @3 /* This mod cannot be installed on this game */
"""
  for file in $(echo "$2" | tr ',' ' ' ); do
    echo "COPY ~%MOD_FOLDER%/$3~ ~override/$file.bmp~"
  done
  echo ""
}

main() {
  file="$1"
  index="$2"
  character=$(echo "$file" | awk -F '/' '{print $NF}' | awk -F '.' '{print $1}')
  selected=${npcs[${character}]}
  if [ -z "${selected}" ]; then
    echo "$character not found in npcs, exiting"
    exit 1
  fi
  template "$character" "$selected" "$file" "$index"
}

main "$@"
