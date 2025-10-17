# TWRP device tree for OnePlus CPH2709 (lexus)

This is a modernized TWRP bring-up skeleton for OnePlus 'lexus' on Qualcomm Pineapple.
- Dynamic partitions + A/B + fastbootd
- Metadata/FBEv2 decryption hooks
- Prebuilt kernel/dtbo/recovery placeholders in /prebuilt

Tune fstab encryption flags if data decryption fails (wrappedkey/ice vs inlinecrypt_optimized).
