#!/usr/bin/gawk -f
#
# Usage: generate_table.sh < ${board}.txt
#
# Takes the file generated by collect.sh and generates an ASCII
# table that can be inserted into the README.md.

BEGIN {
  labels[0] = "Baseline"
  labels[1] = "String"
  labels[2] = "PrintStr<16>"
  labels[3] = "PrintStrN(16)"
  labels[4] = "printPad2()"
  labels[5] = "printPad5()"
  labels[6] = "printUint16AsFloat3To()"
  labels[7] = "printUint32AsFloat3To()"
  labels[8] = "printReplaceCharTo(char*)"
  labels[9] = "printReplaceCharTo(F())"
  labels[10] = "printReplaceStringTo(char*)"
  labels[11] = "printReplaceStringTo(F())"
  labels[12] = "hashDjb2(char*)"
  labels[13] = "hashDjb2(F())"
  labels[14] = "udiv1000()"
  labels[15] = "/1000"
  labels[16] = "isSorted()"
  labels[17] = "reverse()"
  labels[18] = "KString::compareTo(char*)"
  labels[19] = "KString::compareTo(KString&)"
  record_index = 0
}
{
  u[record_index]["flash"] = $2
  u[record_index]["ram"] = $4
  record_index++
}
END {
  NUM_ENTRIES = record_index

  base_flash = u[0]["flash"]
  base_ram = u[0]["ram"]
  for (i = 0; i < NUM_ENTRIES; i++) {
    if (u[i]["flash"] == -1) {
      u[i]["d_flash"] = -1
      u[i]["d_ram"] = -1
    } else {
      u[i]["d_flash"] = u[i]["flash"] - base_flash
      u[i]["d_ram"] = u[i]["ram"]- base_ram
    }
  }

  printf(\
    "+---------------------------------------------------------------------+\n")
  printf(\
    "| Functionality                          |  flash/  ram |       delta |\n")
  for (i = 0; i < NUM_ENTRIES; i++) {
    if (labels[i] ~ /^Baseline/ \
        || labels[i] ~ /^String/ \
        || labels[i] ~ /^printPad2\(\)/ \
        || labels[i] ~ /^hashDjb2\(char\*\)/ \
        || labels[i] ~ /^printReplaceCharTo\(char\*\)/ \
        || labels[i] ~ /^udiv1000/ \
        || labels[i] ~ /^isSorted\(\)/ \
        || labels[i] ~ /^KString::compareTo\(char\*\)/ \
    ) {
      printf(\
        "|----------------------------------------+--------------+-------------|\n")
    }
    printf("| %-38s | %6d/%5d | %5d/%5d |\n",
        labels[i], u[i]["flash"], u[i]["ram"], u[i]["d_flash"], u[i]["d_ram"])
  }
  printf(\
    "+---------------------------------------------------------------------+\n")
}
