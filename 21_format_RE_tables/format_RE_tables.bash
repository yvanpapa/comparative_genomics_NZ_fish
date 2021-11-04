#!/bin/bash
#SBATCH --job-name=format_RE_tables
#SBATCH --cpus-per-task=2
#SBATCH --mem=2G
#SBATCH --partition=quicktest
#SBATCH --time=30:00
#SBATCH -o /nfs/scratch/papayv/Tarakihi/TARdn/Z_fish_assemblies/27_analyze_repeat_families/format_RE_tables_%j.out
#SBATCH -e /nfs/scratch/papayv/Tarakihi/TARdn/Z_fish_assemblies/27_analyze_repeat_families/format_RE_tables_%j.err
#SBATCH --mail-type=BEGIN,END,FAIL
#SBATCH --mail-user=yvan.papa@vuw.ac.nz

dir=/nfs/scratch/papayv/Tarakihi/TARdn/Z_fish_assemblies/27_analyze_repeat_families/
TARdir=/nfs/scratch/papayv/Tarakihi/TARdn/TARdn_assembly_V2_P/20201221_REPEAT_dfam_rb_run3/
TAR=TARdn_assembly_V2_p_srn.fasta.out
KTARdir=/nfs/scratch/papayv/Tarakihi/TARdn/Z_KTAR_pipeline/KTARdn_assembly_V1/
KTAR=KTARdn_assembly_V1_srn.fasta.out
BARdir=/nfs/scratch/papayv/Tarakihi/TARdn/Z_fish_assemblies/Genome_assemblies/BAR/
BAR=BARdn_assembly_V1_srn.fasta.out
BMdir=/nfs/scratch/papayv/Tarakihi/TARdn/Z_fish_assemblies/Genome_assemblies/BM/
BM=BMdn_assembly_V1_srn.fasta.out
BTdir=/nfs/scratch/papayv/Tarakihi/TARdn/Z_fish_assemblies/Genome_assemblies/BT/
BT=BTdn_assembly_V1_srn.fasta.out
KAdir=/nfs/scratch/papayv/Tarakihi/TARdn/Z_fish_assemblies/Genome_assemblies/KA/
KA=KAdn_assembly_V1_srn.fasta.out

sed -e "s/[[:space:]]\+/ /g" $TARdir/$TAR > $dir/$TAR.tabformat1
awk 'NR > 3 { print }' $dir/$TAR.tabformat1 > $dir/$TAR.tabformat2
sed 's/\*//g' $dir/$TAR.tabformat2 > $dir/$TAR.tabformat

sed -e "s/[[:space:]]\+/ /g" $KTARdir/$KTAR > $dir/$KTAR.tabformat1
awk 'NR > 3 { print }' $dir/$KTAR.tabformat1 > $dir/$KTAR.tabformat2
sed 's/\*//g' $dir/$KTAR.tabformat2 > $dir/$KTAR.tabformat

sed -e "s/[[:space:]]\+/ /g" $BARdir/$BAR > $dir/$BAR.tabformat1
awk 'NR > 3 { print }' $dir/$BAR.tabformat1 > $dir/$BAR.tabformat2
sed 's/\*//g' $dir/$BAR.tabformat2 > $dir/$BAR.tabformat

sed -e "s/[[:space:]]\+/ /g" $BMdir/$BM > $dir/$BM.tabformat1
awk 'NR > 3 { print }' $dir/$BM.tabformat1 > $dir/$BM.tabformat2
sed 's/\*//g' $dir/$BM.tabformat2 > $dir/$BM.tabformat

sed -e "s/[[:space:]]\+/ /g" $BTdir/$BT > $dir/$BT.tabformat1
awk 'NR > 3 { print }' $dir/$BT.tabformat1 > $dir/$BT.tabformat2
sed 's/\*//g' $dir/$BT.tabformat2 > $dir/$BT.tabformat

sed -e "s/[[:space:]]\+/ /g" $KAdir/$KA > $dir/$KA.tabformat1
awk 'NR > 3 { print }' $dir/$KA.tabformat1 > $dir/$KA.tabformat2
sed 's/\*//g' $dir/$KA.tabformat2 > $dir/$KA.tabformat

rm $dir/*tabformat1
rm $dir/*tabformat2