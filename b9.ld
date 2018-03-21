OUTPUT_ARCH(i386)
OUTPUT_FORMAT(binary)
SECTIONS {
	. = 0 ;
	.header : {
		*(.header)
	}
	.func_header : {
		*(.func_header)
	}
	.funcs : {
		*(.funcs)
	}
	
	.string_header : {
		*(.string_header)
	}
	.strings : {
		*(.strings)
	}

	/* magical sections we use for ID assignment */
	.id_funcs 0x0 : {
		*(.id_funcs)
	}
	__number_of_funcs = .;
	.id_strings 0x0 : {
		*(.id_strings)
	}
	__number_of_strings = .;
	.id_primitives 0x0 : {
		/* Primitives definitions hack */
		*(.id_primitives)
		PROVIDE(print_string = 0);
		PROVIDE(print_number = 1);
		PROVIDE(print_stack = 2);
		PROVIDE(file_open = 3);
		PROVIDE(file_read_byte = 4);
		PROVIDE(file_read_string = 5);
		PROVIDE(file_tell = 6);
	}
}