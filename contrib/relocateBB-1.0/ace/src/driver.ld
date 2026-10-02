OUTPUT_ARCH(arm)

SECTIONS
{
    .text.emulate_ACEROM_cartridge 0x08020030 : { *(.text.emulate_ACEROM_cartridge*) }
}
