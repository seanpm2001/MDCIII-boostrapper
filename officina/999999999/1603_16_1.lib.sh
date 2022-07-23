#!/bin/bash
#===============================================================================
#
#          FILE:  1603_16_1.lib.sh
#
#         USAGE:  #import on other scripts
#                 . "$ROOTDIR"/999999999/1603_16_1.lib.sh
#
#   DESCRIPTION:  ---
#
#       OPTIONS:  ---
#
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Emerson Rocha <rocha[at]ieee.org>
#       COMPANY:  EticaAI
#       LICENSE:  Public Domain dedication
#                 SPDX-License-Identifier: Unlicense
#       VERSION:  v1.0
#       CREATED:  2022-06-22 21:20 UTC started.
#      REVISION:  ---
#===============================================================================

# echo "DEBUG: starting 1603_16_1.lib.sh"

# shellcheck source=3133368.lib.sh
. "${ROOTDIR}/999999999/3133368.lib.sh"

#######################################
# Update all repositories (if necessary)
#
# Globals:
#   ROOTDIR
#   GH_ORG_DEST
# Arguments:
#
# Outputs:
#    999999/3133368/lexicographi-sine-finibus
#######################################
gh_repo_edit_1603_16_1__topics_and_description() {

  printf "\n\t%40s\n" "${tty_blue}${FUNCNAME[0]} STARTED ${tty_normal}"
  # echo "${FUNCNAME[0]} TODO..."

  gh_repo_name="1603_16_1"
  repo_topics="unm49-001,world"
  gh_repo_emojis="🌐"

  # echo gh repo edit "$GH_ORG_DEST/$gh_repo_name" --add-topic "$repo_topics"
  gh repo edit "$GH_ORG_DEST/$gh_repo_name" --add-topic "$repo_topics"

  gh_repo_edit_description "$gh_repo_name" "$gh_repo_emojis"

  printf "\t%40s\n" "${tty_green}${FUNCNAME[0]} FINISHED OKAY ${tty_normal}"
}

#######################################
# Initialize "world level" level 1603_16
#
# Globals:
#   ROOTDIR
# Arguments:
#
# Outputs:
#    999999/3133368/lexicographi-sine-finibus
#######################################
gh_repo_init_1603_16_1() {

  printf "\n\t%40s\n" "${tty_blue}${FUNCNAME[0]} STARTED ${tty_normal}"
  gh_repo_create_numerordinatio "1603_16_1" "🌐"
  printf "\t%40s\n" "${tty_green}${FUNCNAME[0]} FINISHED OKAY ${tty_normal}"

}

#######################################
# Update 1603_16_1
#
# Globals:
#   DESTDIR
# Arguments:
#
# Outputs:
#    999999/3133368/lexicographi-sine-finibus
#######################################
gh_repo_update_1603_16_1() {
  gh_repo_name="1603_16_1"
  gh_repo_emojis="🌐"

  echo "::group::${gh_repo_name}"

  printf "\n\t%40s\n" "${tty_blue}${FUNCNAME[0]} STARTED ${tty_normal}"
  # echo "TODO"

  archivum_no1__relative="1603/16/1/0/1603_16_1_0.no1.tm.hxl.csv"
  archivum_rdf_owl__relative="1603/16/1/0/1603_16_1_0.no1.owl.ttl"

  set -x
  "${ROOTDIR}/999999999/0/999999999_7200235.py" \
    --methodus='cod_ab_ad_no1_csv' \
    --numerordinatio-praefixo="1603_16" \
    >"${DESTDIR}/$archivum_no1__relative"

  frictionless validate "${DESTDIR}/$archivum_no1__relative"

  "${ROOTDIR}/999999999/0/999999999_7200235.py" \
    --methodus='cod_ab_index_levels_ttl' \
    --numerordinatio-praefixo="1603_16" \
    >"${DESTDIR}/$archivum_rdf_owl__relative"
  set +x

  # echo "@TODO also export the .no1.tm.hxl.csv"

  lsf1603_to_gh_repo_local_file "$gh_repo_name" "$archivum_no1__relative" "${DESTDIR}"
  lsf1603_to_gh_repo_local_file "$gh_repo_name" "$archivum_rdf_owl__relative" "${DESTDIR}"

  _gitattributes__localrepo="999999/3133368/${gh_repo_name}/.gitattributes"
  _gitattributes__templated="999999999/42302/.gitattributes"

  _datapackage_cod_ab_all__localrepo="999999/3133368/${gh_repo_name}/datapackage.json"
  _catalogxml_cod_ab_all__localrepo="999999/3133368/${gh_repo_name}/catalog-v001.xml"
  _csvmetadata_cod_ab_all__localrepo="999999/3133368/${gh_repo_name}/csv-metadata.json"
  _r2rml_cod_ab_all__localrepo="999999/3133368/${gh_repo_name}/mdciii.r2rml.ttl"
  _numerodinatio_cod_ab_all="${gh_repo_name}_0"

  set -x
  DATA_APOTHECAE_MINIMIS="1" \
    "${ROOTDIR}/999999999/0/1603_1.py" --methodus='data-apothecae' \
    --data-apothecae-ex="${_numerodinatio_cod_ab_all}" \
    --data-apothecae-ad="$_datapackage_cod_ab_all__localrepo"

  "${ROOTDIR}/999999999/0/1603_1.py" --methodus='data-apothecae' \
    --data-apothecae-ex="${_numerodinatio_cod_ab_all}" \
    --data-apothecae-ad="${_catalogxml_cod_ab_all__localrepo}"

  "${ROOTDIR}/999999999/0/1603_1.py" --methodus='data-apothecae' \
    --data-apothecae-ex="${_numerodinatio_cod_ab_all}" \
    --data-apothecae-formato='csvw' \
    --data-apothecae-ad-stdout \
    >"$_csvmetadata_cod_ab_all__localrepo"

  "${ROOTDIR}/999999999/0/1603_1.py" --methodus='data-apothecae' \
    --data-apothecae-ex="${_numerodinatio_cod_ab_all}" \
    --data-apothecae-formato='r2rml' \
    --data-apothecae-ad-stdout \
    >"$_r2rml_cod_ab_all__localrepo"

  # ./999999999/0/1603_1.py --methodus='data-apothecae' --data-apothecae-ad-stdout --data-apothecae-formato='r2rml' --data-apothecae-ex-suffixis='no1.tm.hxl.csv,no11.tm.hxl.csv' --data-apothecae-ex-praefixis='1603_1_1'
  set +x

  # shellcheck disable=SC2164
  cd "${DESTDIR}/999999/3133368/${gh_repo_name}"

  pwd
  frictionless validate "datapackage.json" || echo "FIX ME [${gh_repo_name}]. Know bug. not sure why frictionless is complaining here BUT works in production. Leaving notice here anyway"

  # shellcheck disable=SC2164
  cd "${ROOTDIR}"

  # @TODO when templated .gitattributes changes, this logic will need to
  #       be manually changed at least once
  if [ ! -f "$_gitattributes__localrepo" ]; then
    echo "Adding .gitattributes first time [$_gitattributes__localrepo]"
    cp "$_gitattributes__templated" "$_gitattributes__localrepo"
  fi

  gh_repo_edit_readme "$gh_repo_name" "${gh_repo_emojis}"
  # gh_repo_sync_push "${gh_repo_name}"

  # ./999999999/0/999999999_7200235.py --methodus='cod_ab_ad_no1_csv'

  # ./999999999/0/999999999_7200235.py --methodus='cod_ab_index' --punctum-separato-ad-tab --cum-columnis='#country+code+v_unm49,#country+code+v_iso3,#country+code+v_iso2,#meta+source+cod_ab_level,#date+created,#date+updated'

  echo "::endgroup::"

  printf "\t%40s\n" "${tty_green}${FUNCNAME[0]} FINISHED OKAY ${tty_normal}"
}

#######################################
# Update 1603_16_1_0 (ab level 0)
# Similar to bootstrap_1603_16_1_0__radix(), however reuse
# 1603_16_1_0.no1.tm.hxl.csv to re-generate the rest.
#
# Globals:
#   DESTDIR
# Arguments:
#
# Outputs:
#    999999/3133368/lexicographi-sine-finibus
#######################################
gh_repo_update_1603_16_1__boostrap_0() {
  gh_repo_name="1603_16_1"

  _radix_apothecae="${DESTDIR}"
  _radix_localrepo="${DESTDIR}/999999/3133368/${gh_repo_name}"

  archivum_no1__relative="1603/16/1/0/1603_16_1_0.no1.tm.hxl.csv"
  archivum_no1_bcp47min__relative="1603/16/1/0/1603_16_1_0.no1.bcp47.csv"
  archivum_no1_owl__relative="1603/16/1/0/1603_16_1_0.no1.owl.ttl"
  #archivum_no1_skos__relative="not applicable"

  archivum_no11__relative="1603/16/1/0/1603_16_1_0.no11.tm.hxl.csv"
  archivum_no11_bcp47min__relative="1603/16/1/0/1603_16_1_0.no11.bcp47.csv"
  #archivum_no11_owl__relative="not applicable"
  archivum_no11_skos__relative="1603/16/1/0/1603_16_1_0.no11.skos.ttl"

  archivum_wikiq__relative="1603/16/1/0/1603_16_1_0.wikiq.tm.hxl.csv"

  csv_temporarium_1="${DESTDIR}/999999/0/${gh_repo_name}_0~TEMP~1.csv"
  csv_temporarium_2="${DESTDIR}/999999/0/${gh_repo_name}_0~TEMP~2.csv"

  ttl_temporarium_1="${DESTDIR}/999999/0/${gh_repo_name}_0~TEMP~1.ttl"
  ttl_temporarium_2="${DESTDIR}/999999/0/${gh_repo_name}_0~TEMP~2.ttl"

  printf "\n\t%40s\n" "${tty_blue}${FUNCNAME[0]} STARTED ${tty_normal}"
  start_time_fn_b=$(date +%s)

  ls -lha 1603/16/1/0/
  ls -lha "$_radix_localrepo"

  ## NO1 bcp47 -----------------------------------------------------------------
  set -x
  "${ROOTDIR}/999999999/0/999999999_54872.py" \
    --methodus=_temp_no1_to_no1_shortnames \
    --real-infile-path="${_radix_apothecae}/${archivum_no1__relative}" \
    >"${csv_temporarium_1}"

  # Temporary fix: remove some generated tags with error: +ix_error
  # Somewhat temporary: remove non-merget alts: +ix_alt1|+ix_alt12|+ix_alt13
  # Non-temporary: remove implicit tags: +ix_hxlattrs
  hxlcut \
    --exclude='#*+ix_error,#*+ix_hxlattrs,#*+ix_alt1,#*+ix_alt2,#*+ix_alt3' \
    "${csv_temporarium_1}" >"${csv_temporarium_2}"

  # Delete first line ,,,,,
  sed -i '1d' "${csv_temporarium_2}"

  "${ROOTDIR}/999999999/0/999999999_54872.py" \
    --methodus=_temp_data_hxl_to_bcp47 \
    --real-infile-path="${csv_temporarium_2}" >"${csv_temporarium_1}"

  frictionless validate "${csv_temporarium_1}"

  set +x
  file_update_if_necessary "skip-validation" \
    "${csv_temporarium_1}" \
    "${_radix_apothecae}/${archivum_no1_bcp47min__relative}"

  ## NO1 bcp47 -----------------------------------------------------------------

  set +x
  ls -lha "$_radix_localrepo"

  end_time=$(date +%s)
  elapsed=$((end_time - start_time_fn_b))
  printf "\t%40s\n" "${tty_green}${FUNCNAME[0]} FINISHED OKAY in ${elapsed}s ${tty_normal}"
}
