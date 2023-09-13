#!/usr/bin/env nextflow

nextflow.enable.dsl = 2

include { GEM2_GEMINDEXER   } from '../../../../../modules/nf-core/gem2/gemindexer/main.nf'
include { GEM3_GEM3MAPPER   } from '../../../../../modules/nf-core/gem3/gem3mapper/main.nf'

workflow test_gem3_gem3mapper {
    
    input = [
        [ id:'test', single_end:false ], // meta map
        file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)
    ]

    GEM2_GEMINDEXER ( input )
    
    fasta = file(params.test_data['sarscov2']['genome']['genome_fasta'], checkIfExists: true)

    fastq = [
        [ id:'test', single_end:true ], // meta map
        [
            file(params.test_data['sarscov2']['illumina']['test_1_fastq_gz'], checkIfExists: true)
        ]
    ]

    GEM3_GEM3MAPPER ( GEM2_GEMINDEXER.out.index, fastq )
}
