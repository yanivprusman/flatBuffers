Usage: flatc [OPTION]... FILE... [-- BINARY_FILE...]
  -b, --binary           Generate wire format binaries for any data definitions
  -c, --cpp              Generate C++ headers for tables/structs
  -n, --csharp           Generate C# classes for tables/structs
  -d, --dart             Generate Dart classes for tables/structs
  -g, --go               Generate Go files for tables/structs
  -j, --java             Generate Java classes for tables/structs
  -t, --json             Generate text output for any data definitions
  --jsonschema           Generate Json schema
  --kotlin               Generate Kotlin classes for tables/structs
  --kotlin-kmp           Generate Kotlin multiplatform classes for
                         tables/structs
  --lobster              Generate Lobster files for tables/structs
  -l, --lua              Generate Lua files for tables/structs
  --nim                  Generate Nim files for tables/structs
  --php                  Generate PHP files for tables/structs
  --proto                Input is a .proto, translate to .fbs
  -p, --python           Generate Python files for tables/structs
  -r, --rust             Generate Rust files for tables/structs
  --swift                Generate Swift files for tables/structs
  -T, --ts               Generate TypeScript code for tables/structs

  -o PATH                Prefix PATH to all generated files.
  -I PATH                Search for includes in the specified path.
  -M                     Print make rules for generated files.
  --version              Print the version number of flatc and exit.
  -h, --help             Prints this help text and exit.
  --strict-json          Strict JSON: field names must be / will be quoted, no
                         trailing commas in tables/vectors.
  --allow-non-utf8       Pass non-UTF-8 input through parser and emit
                         nonstandard \x escapes in JSON. (Default is to raise
                         parse error on non-UTF-8 input.)
  --natural-utf8         Output strings with UTF-8 as human-readable strings. By
                         default, UTF-8 characters are printed as \uXXXX
                         escapes.
  --defaults-json        Output fields whose value is the default when writing
                         JSON
  --unknown-json         Allow fields in JSON that are not defined in the
                         schema. These fields will be discarded when generating
                         binaries.
  --no-prefix            Don't prefix enum values with the enum type in C++.
  --scoped-enums         Use C++11 style scoped and strongly typed enums. Also
                         implies --no-prefix.
  --no-emit-min-max-enum-values 
                         Disable generation of MIN and MAX enumerated values for
                         scoped enums and prefixed enums.
  --swift-implementation-only 
                         Adds a @_implementationOnly to swift imports
  --gen-includes         (deprecated), this is the default behavior. If the
                         original behavior is required (no include statements)
                         use --no-includes.
  --no-includes          Don't generate include statements for included schemas
                         the generated file depends on (C++, Python,
                         Proto-to-Fbs).
  --gen-mutable          Generate accessors that can mutate buffers in-place.
  --gen-onefile          Generate a single output file for C#, Go, Java, Kotlin
                         and Python. Implies --no-include.
  --gen-name-strings     Generate type name functions for C++ and Rust.
  --gen-object-api       Generate an additional object-based API.
  --gen-compare          Generate operator== for object-based API types.
  --gen-nullable         Add Clang _Nullable for C++ pointer. or @Nullable for
                         Java
  --java-package-prefix  Add a prefix to the generated package name for Java.
  --java-checkerframework 
                         Add @Pure for Java.
  --gen-generated        Add @Generated annotation for Java.
  --gen-jvmstatic        Add @JvmStatic annotation for Kotlin methods in
                         companion object for interop from Java to Kotlin.
  --gen-all              Generate not just code for the current schema files,
                         but for all files it includes as well. If the language
                         uses a single file for output (by default the case for
                         C++ and JS), all code will end up in this one file.
  --gen-json-emit        Generates encoding code which emits Flatbuffers into
                         JSON
  --cpp-include          Adds an #include in generated file.
  --cpp-ptr-type T       Set object API pointer type (default std::unique_ptr).
  --cpp-str-type T       Set object API string type (default std::string).
                         T::c_str(), T::length() and T::empty() must be
                         supported. The custom type also needs to be
                         constructible from std::string (see the
                         --cpp-str-flex-ctor option to change this behavior)
  --cpp-str-flex-ctor    Don't construct custom string types by passing
                         std::string from Flatbuffers, but (char* + length).
  --cpp-field-case-style STYLE 
                         Generate C++ fields using selected case style.
                         Supported STYLE values: * 'unchanged' - leave unchanged
                         (default) * 'upper' - schema snake_case emits
                         UpperCamel; * 'lower' - schema snake_case emits
                         lowerCamel.
  --cpp-std CPP_STD      Generate a C++ code using features of selected C++
                         standard. Supported CPP_STD values: * 'c++0x' -
                         generate code compatible with old compilers; 'c++11' -
                         use C++11 code generator (default); * 'c++17' - use
                         C++17 features in generated code (experimental).
  --cpp-static-reflection 
                         When using C++17, generate extra code to provide
                         compile-time (static) reflection of Flatbuffers types.
                         Requires --cpp-std to be "c++17" or higher.
  --object-prefix PREFIX Customize class prefix for C++ object-based API.
  --object-suffix SUFFIX Customize class suffix for C++ object-based API.
                         Default Value is "T".
  --go-namespace         Generate the overriding namespace in Golang.
  --go-import IMPORT     Generate the overriding import for flatbuffers in
                         Golang (default is "github.com/google/flatbuffers/go").
  --go-module-name       Prefix local import paths of generated go code with the
                         module name
  --raw-binary           Allow binaries without file_identifier to be read. This
                         may crash flatc given a mismatched schema.
  --size-prefixed        Input binaries are size prefixed buffers.
  --proto-namespace-suffix SUFFIX 
                         Add this namespace to any flatbuffers generated from
                         protobufs.
  --oneof-union          Translate .proto oneofs to flatbuffer unions.
  --keep-proto-id        Keep protobuf field ids in generated fbs file.
  --proto-id-gap         Action that should be taken when a gap between protobuf
                         ids found. Supported values: * 'nop' - do not care
                         about gap * 'warn' - A warning message will be shown
                         about the gap in protobuf ids(default) * 'error' - An
                         error message will be shown and the fbs generation will
                         be interrupted.
  --grpc                 Generate GRPC interfaces for the specified languages.
  --schema               Serialize schemas instead of JSON (use with -b).
  --bfbs-filenames PATH  Sets the root path where reflection filenames in
                         reflection.fbs are relative to. The 'root' is denoted
                         with  `//`. E.g. if PATH=/a/b/c then /a/d/e.fbs will be
                         serialized as //../d/e.fbs. (PATH defaults to the
                         directory of the first provided schema file.
  --bfbs-absolute-paths  Uses absolute paths instead of relative paths in the
                         BFBS output.
  --bfbs-comments        Add doc comments to the binary schema files.
  --bfbs-builtins        Add builtin attributes to the binary schema files.
  --bfbs-gen-embed       Generate code to embed the bfbs schema to the source.
  --conform FILE         Specify a schema the following schemas should be an
                         evolution of. Gives errors if not.
  --conform-includes PATH 
                         Include path for the schema given with --conform PATH
  --filename-suffix SUFFIX 
                         The suffix appended to the generated file names
                         (Default is '_generated').
  --filename-ext EXT     The extension appended to the generated file names.
                         Default is language-specific (e.g., '.h' for C++)
  --include-prefix PATH  Prefix this PATH to any generated include statements.
  --keep-prefix          Keep original prefix of schema include statement.
  --reflect-types        Add minimal type reflection to code generation.
  --reflect-names        Add minimal type/name reflection.
  --rust-serialize       Implement serde::Serialize on generated Rust types.
  --rust-module-root-file 
                         Generate rust code in individual files with a module
                         root file.
  --root-type T          Select or override the default root_type.
  --require-explicit-ids When parsing schemas, require explicit ids (id: x).
  --force-defaults       Emit default values in binary output from JSON
  --force-empty          When serializing from object API representation, force
                         strings and vectors to empty rather than null.
  --force-empty-vectors  When serializing from object API representation, force
                         vectors to empty rather than null.
  --flexbuffers          Used with "binary" and "json" options, it generates
                         data using schema-less FlexBuffers.
  --no-warnings          Inhibit all warnings messages.
  --warnings-as-errors   Treat all warnings as errors.
  --cs-global-alias      Prepend "global::" to all user generated csharp classes
                         and structs.
  --cs-gen-json-serializer 
                         Allows (de)serialization of JSON text in the Object
                         API. (requires --gen-object-api).
  --json-nested-bytes    Allow a nested_flatbuffer field to be parsed as a
                         vector of bytes in JSON, which is unsafe unless checked
                         by a verifier afterwards.
  --ts-flat-files        Generate a single typescript file per .fbs file.
                         Implies ts_entry_points.
  --ts-entry-points      Generate entry point typescript per namespace. Implies
                         gen-all.
  --annotate-sparse-vectors 
                         Don't annotate every vector element.
  --annotate SCHEMA      Annotate the provided BINARY_FILE with the specified
                         SCHEMA file.
  --no-leak-private-annotation 
                         Prevents multiple type of annotations within a Fbs
                         SCHEMA file. Currently this is required to generate
                         private types in Rust
  --python-no-type-prefix-suffix 
                         Skip emission of Python functions that are prefixed
                         with typenames
  --python-typing        Generate Python type annotations
  --python-version       Generate code for the given Python version.
  --python-gen-numpy     Whether to generate numpy helpers.
  --ts-omit-entrypoint   Omit emission of namespace entrypoint file
  --file-names-only      Print out generated file names without writing to the
                         files
  --grpc-filename-suffix SUFFIX 
                         The suffix for the generated file names (Default is
                         '.fb').
  --grpc-additional-header 
                         Additional headers to prepend to the generated files.
  --grpc-use-system-headers 
                         Use <> for headers included from the generated code.
  --grpc-search-path PATH 
                         Prefix to any gRPC includes.
  --grpc-python-typed-handlers 
                         The handlers will use the generated classes rather than
                         raw bytes.

FILEs may be schemas (must end in .fbs), binary schemas (must end in .bfbs) or
JSON files (conforming to preceding schema). BINARY_FILEs after the -- must be
binary flatbuffer format files. Output files are named using the base file name
of the input, and written to the current directory or the path given by -o.
example: flatc -c -b schema1.fbs schema2.fbs data.json

