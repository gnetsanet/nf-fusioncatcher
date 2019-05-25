/*
Change the list of files 

UNCID_2637215.c8e08e13-b873-437d-94ac-fca3e6cb2e1e.140703_UNC15-SN850_0374_AC4UEAACXX_3_CGATGT.tar.gz
UNCID_2637218.3407b825-5ee0-4f18-ba5c-64cf0893805a.140703_UNC15-SN850_0374_AC4UEAACXX_2_GGCTAC.tar.gz
UNCID_2637226.38acdbd8-a886-47aa-8714-f5cdc5b28dbf.140625_UNC11-SN627_0364_AC4HLGACXX_5_CCGTCC.tar.gz
UNCID_2637247.859f3a2e-27b0-4e2c-9c15-00a2a2f8085d.140603_UNC11-SN627_0360_AC4H72ACXX_2_AGTTCC.tar.gz
UNCID_2637248.aca1bd2b-34c4-4efb-9c54-0f1a411307ba.140611_UNC13-SN749_0355_BC4K53ACXX_4_GATCAG.tar.gz
UNCID_2637249.cf2d53e3-8307-451b-907e-9aec395e7bd1.140611_UNC13-SN749_0355_BC4K53ACXX_4_ATCACG.tar.gz
UNCID_2638477.b5e66e97-14f7-4204-88ad-551abebe1c81.140625_UNC11-SN627_0364_AC4HLGACXX_4_ATGTCA.tar.gz
UNCID_2664323.92bdff6a-3f39-401c-afd7-086ba68d3cf2.141031_UNC11-SN627_0387_AC5FAKACXX_6_GTGGCC.tar.gz
UNCID_2668045.3ab8aba7-9bde-42d3-b95b-e12e2779470b.150108_UNC15-SN850_0402_AC5FTHACXX_3_ATCACG.tar.gz

to the following data structure

[UNCID_2637215, UNCID_2637215.c8e08e13-b873-437d-94ac-fca3e6cb2e1e.140703_UNC15-SN850_0374_AC4UEAACXX_3_CGATGT.tar.gz]
[UNCID_2637218, UNCID_2637218.3407b825-5ee0-4f18-ba5c-64cf0893805a.140703_UNC15-SN850_0374_AC4UEAACXX_2_GGCTAC.tar.gz]
[UNCID_2637226, UNCID_2637226.38acdbd8-a886-47aa-8714-f5cdc5b28dbf.140625_UNC11-SN627_0364_AC4HLGACXX_5_CCGTCC.tar.gz]
[UNCID_2637247, UNCID_2637247.859f3a2e-27b0-4e2c-9c15-00a2a2f8085d.140603_UNC11-SN627_0360_AC4H72ACXX_2_AGTTCC.tar.gz]
[UNCID_2637248, UNCID_2637248.aca1bd2b-34c4-4efb-9c54-0f1a411307ba.140611_UNC13-SN749_0355_BC4K53ACXX_4_GATCAG.tar.gz]
[UNCID_2637249, UNCID_2637249.cf2d53e3-8307-451b-907e-9aec395e7bd1.140611_UNC13-SN749_0355_BC4K53ACXX_4_ATCACG.tar.gz]
[UNCID_2638477, UNCID_2638477.b5e66e97-14f7-4204-88ad-551abebe1c81.140625_UNC11-SN627_0364_AC4HLGACXX_4_ATGTCA.tar.gz]
[UNCID_2664323, UNCID_2664323.92bdff6a-3f39-401c-afd7-086ba68d3cf2.141031_UNC11-SN627_0387_AC5FAKACXX_6_GTGGCC.tar.gz]
[UNCID_2668045, UNCID_2668045.3ab8aba7-9bde-42d3-b95b-e12e2779470b.150108_UNC15-SN850_0402_AC5FTHACXX_3_ATCACG.tar.gz]


Channel
	.fromPath("/Users/ngebremedhin/tcga.txt")
	.splitCsv(header: false)
	.map { line -> [line[0].tokenize(".")[0], line[0]]}
	.subscribe { println it }

*/

chunk = params.chunk

process collectFilesToDownload {
	
	publishDir "s3://bioinformatics-analysis/FusionCatcher/", mode: 'copy', overwrite: true

	output:
	file("${chunk}.txt") into filesList

	script:
	"""
	/root/anaconda2/bin/aws s3 cp s3://bioinformatics-analysis/${chunk}.txt ./${chunk}.txt
	"""

}


process dowloadFastqFiles {
		
	memory 24.GB

	beforeScript 'chmod -R 777 /tmp'	

	input:
	set sampleId, tarFile from filesList.splitCsv(header:false).map { line -> [line[0].tokenize(".")[0], line[0]]}

	script:
	"""
	/root/anaconda2/bin/aws s3 cp s3://bioinformatics-analysis/TCGA/${tarFile} ./${tarFile}

	mkdir -p ./${sampleId}/Input

	mkdir -p ./${sampleId}/Output

	tar -xzvf ${tarFile} --directory ./${sampleId}/Input

	/root/anaconda2/envs/fusioncatcher/bin/fusioncatcher -i ./${sampleId}/Input -o ./${sampleId}/Output --data /efs/references/human_v90/

    /root/anaconda2/bin/aws s3 cp ./${sampleId}/Output s3://bioinformatics-analysis/FusionCatcher/${sampleId} --recursive
	"""
}