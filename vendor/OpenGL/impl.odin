package odin_gl

loaded_up_to: [2]int;
loaded_up_to_major := 0;
loaded_up_to_minor := 0;

Set_Proc_Address_Type :: #type proc(p: rawptr, name: cstring);

load_up_to :: proc(major, minor : int, set_proc_address: Set_Proc_Address_Type) {
	loaded_up_to = {0, 0};
	loaded_up_to[0] = major;
	loaded_up_to[1] = minor;
	loaded_up_to_major = major;
	loaded_up_to_minor = minor;

	switch major*10+minor {
	case 46: load_4_6(set_proc_address); fallthrough;
	case 45: load_4_5(set_proc_address); fallthrough;
	case 44: load_4_4(set_proc_address); fallthrough;
	case 43: load_4_3(set_proc_address); fallthrough;
	case 42: load_4_2(set_proc_address); fallthrough;
	case 41: load_4_1(set_proc_address); fallthrough;
	case 40: load_4_0(set_proc_address); fallthrough;
	case 33: load_3_3(set_proc_address); fallthrough;
	case 32: load_3_2(set_proc_address); fallthrough;
	case 31: load_3_1(set_proc_address); fallthrough;
	case 30: load_3_0(set_proc_address); fallthrough;
	case 21: load_2_1(set_proc_address); fallthrough;
	case 20: load_2_0(set_proc_address); fallthrough;
	case 15: load_1_5(set_proc_address); fallthrough;
	case 14: load_1_4(set_proc_address); fallthrough;
	case 13: load_1_3(set_proc_address); fallthrough;
	case 12: load_1_2(set_proc_address); fallthrough;
	case 11: load_1_1(set_proc_address); fallthrough;
	case 10: load_1_0(set_proc_address);
	}
}

/*
Type conversion overview:
	typedef unsigned int GLenum;     -> u32
	typedef unsigned char GLboolean; -> bool
	typedef unsigned int GLbitfield; -> u32
	typedef signed char GLbyte;      -> i8
	typedef short GLshort;           -> i16
	typedef int GLint;               -> i32
	typedef unsigned char GLubyte;   -> u8
	typedef unsigned short GLushort; -> u16
	typedef unsigned int GLuint;     -> u32
	typedef int GLsizei;             -> i32
	typedef float GLfloat;           -> f32
	typedef double GLdouble;         -> f64
	typedef char GLchar;             -> u8
	typedef ptrdiff_t GLintptr;      -> int
	typedef ptrdiff_t GLsizeiptr;    -> int
	typedef int64_t GLint64;         -> i64
	typedef uint64_t GLuint64;       -> u64

	void*                            -> rawptr
*/

sync_t :: rawptr;
debug_proc_t :: #type proc "c" (source: u32, type: u32, id: u32, severity: u32, length: i32, message: cstring, userParam: rawptr);


// VERSION_1_0
impl_CullFace:               proc "c" (mode: u32);
impl_FrontFace:              proc "c" (mode: u32);
impl_Hint:                   proc "c" (target: u32, mode: u32);
impl_LineWidth:              proc "c" (width: f32);
impl_PointSize:              proc "c" (size: f32);
impl_PolygonMode:            proc "c" (face: u32, mode: u32);
impl_Scissor:                proc "c" (x: i32, y: i32, width: i32, height: i32);
impl_TexParameterf:          proc "c" (target: u32, pname: u32, param: f32);
impl_TexParameterfv:         proc "c" (target: u32, pname: u32, params: [^]f32);
impl_TexParameteri:          proc "c" (target: u32, pname: u32, param: i32);
impl_TexParameteriv:         proc "c" (target: u32, pname: u32, params: [^]i32);
impl_TexImage1D:             proc "c" (target: u32, level: i32, internalformat: i32, width: i32, border: i32, format: u32, type: u32, pixels: rawptr);
impl_TexImage2D:             proc "c" (target: u32, level: i32, internalformat: i32, width: i32, height: i32, border: i32, format: u32, type: u32, pixels: rawptr);
impl_DrawBuffer:             proc "c" (buf: u32);
impl_Clear:                  proc "c" (mask: u32);
impl_ClearColor:             proc "c" (red: f32, green: f32, blue: f32, alpha: f32);
impl_ClearStencil:           proc "c" (s: i32);
impl_ClearDepth:             proc "c" (depth: f64);
impl_StencilMask:            proc "c" (mask: u32);
impl_ColorMask:              proc "c" (red: u8, green: u8, blue: u8, alpha: u8);
impl_DepthMask:              proc "c" (flag: u8);
impl_Disable:                proc "c" (cap: u32);
impl_Enable:                 proc "c" (cap: u32);
impl_Finish:                 proc "c" ();
impl_Flush:                  proc "c" ();
impl_BlendFunc:              proc "c" (sfactor: u32, dfactor: u32);
impl_LogicOp:                proc "c" (opcode: u32);
impl_StencilFunc:            proc "c" (func: u32, ref: i32, mask: u32);
impl_StencilOp:              proc "c" (fail: u32, zfail: u32, zpass: u32);
impl_DepthFunc:              proc "c" (func: u32);
impl_PixelStoref:            proc "c" (pname: u32, param: f32);
impl_PixelStorei:            proc "c" (pname: u32, param: i32);
impl_ReadBuffer:             proc "c" (src: u32);
impl_ReadPixels:             proc "c" (x: i32, y: i32, width: i32, height: i32, format: u32, type: u32, pixels: rawptr);
impl_GetBooleanv:            proc "c" (pname: u32, data: ^bool);
impl_GetDoublev:             proc "c" (pname: u32, data: ^f64);
impl_GetError:               proc "c" () -> u32;
impl_GetFloatv:              proc "c" (pname: u32, data: ^f32);
impl_GetIntegerv:            proc "c" (pname: u32, data: ^i32);
impl_GetString:              proc "c" (name: u32) -> cstring;
impl_GetTexImage:            proc "c" (target: u32,  level: i32, format: u32, type: u32, pixels: rawptr);
impl_GetTexParameterfv:      proc "c" (target: u32, pname: u32, params: [^]f32);
impl_GetTexParameteriv:      proc "c" (target: u32, pname: u32, params: [^]i32);
impl_GetTexLevelParameterfv: proc "c" (target: u32, level: i32, pname: u32, params: [^]f32);
impl_GetTexLevelParameteriv: proc "c" (target: u32, level: i32, pname: u32, params: [^]i32);
impl_IsEnabled:              proc "c" (cap: u32) -> bool;
impl_DepthRange:             proc "c" (near: f64, far: f64);
impl_Viewport:               proc "c" (x: i32, y: i32, width: i32, height: i32);

load_1_0 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_CullFace,               "glCullFace");
	set_proc_address(&impl_FrontFace,              "glFrontFace");
	set_proc_address(&impl_Hint,                   "glHint");
	set_proc_address(&impl_LineWidth,              "glLineWidth");
	set_proc_address(&impl_PointSize,              "glPointSize");
	set_proc_address(&impl_PolygonMode,            "glPolygonMode");
	set_proc_address(&impl_Scissor,                "glScissor");
	set_proc_address(&impl_TexParameterf,          "glTexParameterf");
	set_proc_address(&impl_TexParameterfv,         "glTexParameterfv");
	set_proc_address(&impl_TexParameteri,          "glTexParameteri");
	set_proc_address(&impl_TexParameteriv,         "glTexParameteriv");
	set_proc_address(&impl_TexImage1D,             "glTexImage1D");
	set_proc_address(&impl_TexImage2D,             "glTexImage2D");
	set_proc_address(&impl_DrawBuffer,             "glDrawBuffer");
	set_proc_address(&impl_Clear,                  "glClear");
	set_proc_address(&impl_ClearColor,             "glClearColor");
	set_proc_address(&impl_ClearStencil,           "glClearStencil");
	set_proc_address(&impl_ClearDepth,             "glClearDepth");
	set_proc_address(&impl_StencilMask,            "glStencilMask");
	set_proc_address(&impl_ColorMask,              "glColorMask");
	set_proc_address(&impl_DepthMask,              "glDepthMask");
	set_proc_address(&impl_Disable,                "glDisable");
	set_proc_address(&impl_Enable,                 "glEnable");
	set_proc_address(&impl_Finish,                 "glFinish");
	set_proc_address(&impl_Flush,                  "glFlush");
	set_proc_address(&impl_BlendFunc,              "glBlendFunc");
	set_proc_address(&impl_LogicOp,                "glLogicOp");
	set_proc_address(&impl_StencilFunc,            "glStencilFunc");
	set_proc_address(&impl_StencilOp,              "glStencilOp");
	set_proc_address(&impl_DepthFunc,              "glDepthFunc");
	set_proc_address(&impl_PixelStoref,            "glPixelStoref");
	set_proc_address(&impl_PixelStorei,            "glPixelStorei");
	set_proc_address(&impl_ReadBuffer,             "glReadBuffer");
	set_proc_address(&impl_ReadPixels,             "glReadPixels");
	set_proc_address(&impl_GetBooleanv,            "glGetBooleanv");
	set_proc_address(&impl_GetDoublev,             "glGetDoublev");
	set_proc_address(&impl_GetError,               "glGetError");
	set_proc_address(&impl_GetFloatv,              "glGetFloatv");
	set_proc_address(&impl_GetIntegerv,            "glGetIntegerv");
	set_proc_address(&impl_GetString,              "glGetString");
	set_proc_address(&impl_GetTexImage,            "glGetTexImage");
	set_proc_address(&impl_GetTexParameterfv,      "glGetTexParameterfv");
	set_proc_address(&impl_GetTexParameteriv,      "glGetTexParameteriv");
	set_proc_address(&impl_GetTexLevelParameterfv, "glGetTexLevelParameterfv");
	set_proc_address(&impl_GetTexLevelParameteriv, "glGetTexLevelParameteriv");
	set_proc_address(&impl_IsEnabled,              "glIsEnabled");
	set_proc_address(&impl_DepthRange,             "glDepthRange");
	set_proc_address(&impl_Viewport,               "glViewport");
}


// VERSION_1_1
impl_DrawArrays:        proc "c" (mode: u32, first: i32, count: i32);
impl_DrawElements:      proc "c" (mode: u32, count: i32, type: u32, indices: rawptr);
impl_PolygonOffset:     proc "c" (factor: f32, units: f32);
impl_CopyTexImage1D:    proc "c" (target: u32, level: i32, internalformat: u32, x: i32, y: i32, width: i32, border: i32);
impl_CopyTexImage2D:    proc "c" (target: u32, level: i32, internalformat: u32, x: i32, y: i32, width: i32, height: i32, border: i32);
impl_CopyTexSubImage1D: proc "c" (target: u32, level: i32, xoffset: i32, x: i32, y: i32, width: i32);
impl_CopyTexSubImage2D: proc "c" (target: u32, level: i32, xoffset: i32, yoffset: i32, x: i32, y: i32, width: i32, height: i32);
impl_TexSubImage1D:     proc "c" (target: u32, level: i32, xoffset: i32, width: i32, format: u32, type: u32, pixels: rawptr);
impl_TexSubImage2D:     proc "c" (target: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, type: u32, pixels: rawptr);
impl_BindTexture:       proc "c" (target: u32, texture: u32);
impl_DeleteTextures:    proc "c" (n: i32, textures: [^]u32);
impl_GenTextures:       proc "c" (n: i32, textures: [^]u32);
impl_IsTexture:         proc "c" (texture: u32) -> bool;

load_1_1 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_DrawArrays,        "glDrawArrays");
	set_proc_address(&impl_DrawElements,      "glDrawElements");
	set_proc_address(&impl_PolygonOffset,     "glPolygonOffset");
	set_proc_address(&impl_CopyTexImage1D,    "glCopyTexImage1D");
	set_proc_address(&impl_CopyTexImage2D,    "glCopyTexImage2D");
	set_proc_address(&impl_CopyTexSubImage1D, "glCopyTexSubImage1D");
	set_proc_address(&impl_CopyTexSubImage2D, "glCopyTexSubImage2D");
	set_proc_address(&impl_TexSubImage1D,     "glTexSubImage1D");
	set_proc_address(&impl_TexSubImage2D,     "glTexSubImage2D");
	set_proc_address(&impl_BindTexture,       "glBindTexture");
	set_proc_address(&impl_DeleteTextures,    "glDeleteTextures");
	set_proc_address(&impl_GenTextures,       "glGenTextures");
	set_proc_address(&impl_IsTexture,         "glIsTexture");
}


// VERSION_1_2
impl_DrawRangeElements: proc "c" (mode: u32, start: u32, end: u32, count: i32, type: u32, indices: rawptr);
impl_TexImage3D:        proc "c" (target: u32, level: i32, internalformat: i32, width: i32, height: i32, depth: i32, border: i32, format: u32, type: u32, pixels: rawptr);
impl_TexSubImage3D:     proc "c" (target: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, type: u32, pixels: rawptr);
impl_CopyTexSubImage3D: proc "c" (target: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, x: i32, y: i32, width: i32, height: i32);

load_1_2 :: proc(set_proc_address: Set_Proc_Address_Type) {

	set_proc_address(&impl_DrawRangeElements, "glDrawRangeElements");
	set_proc_address(&impl_TexImage3D,        "glTexImage3D");
	set_proc_address(&impl_TexSubImage3D,     "glTexSubImage3D");
	set_proc_address(&impl_CopyTexSubImage3D, "glCopyTexSubImage3D");
}


// VERSION_1_3
impl_ActiveTexture:           proc "c" (texture: u32);
impl_SampleCoverage:          proc "c" (value: f32, invert: u8);
impl_CompressedTexImage3D:    proc "c" (target: u32, level: i32, internalformat: u32, width: i32, height: i32, depth: i32, border: i32, imageSize: i32, data: rawptr);
impl_CompressedTexImage2D:    proc "c" (target: u32, level: i32, internalformat: u32, width: i32, height: i32, border: i32, imageSize: i32, data: rawptr);
impl_CompressedTexImage1D:    proc "c" (target: u32, level: i32, internalformat: u32, width: i32, border: i32, imageSize: i32, data: rawptr);
impl_CompressedTexSubImage3D: proc "c" (target: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, imageSize: i32, data: rawptr);
impl_CompressedTexSubImage2D: proc "c" (target: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, imageSize: i32, data: rawptr);
impl_CompressedTexSubImage1D: proc "c" (target: u32, level: i32, xoffset: i32, width: i32, format: u32, imageSize: i32, data: rawptr);
impl_GetCompressedTexImage:   proc "c" (target: u32, level: i32, img: rawptr);

load_1_3 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_ActiveTexture,           "glActiveTexture");
	set_proc_address(&impl_SampleCoverage,          "glSampleCoverage");
	set_proc_address(&impl_CompressedTexImage3D,    "glCompressedTexImage3D");
	set_proc_address(&impl_CompressedTexImage2D,    "glCompressedTexImage2D");
	set_proc_address(&impl_CompressedTexImage1D,    "glCompressedTexImage1D");
	set_proc_address(&impl_CompressedTexSubImage3D, "glCompressedTexSubImage3D");
	set_proc_address(&impl_CompressedTexSubImage2D, "glCompressedTexSubImage2D");
	set_proc_address(&impl_CompressedTexSubImage1D, "glCompressedTexSubImage1D");
	set_proc_address(&impl_GetCompressedTexImage,   "glGetCompressedTexImage");
}


// VERSION_1_4
impl_BlendFuncSeparate: proc "c" (sfactorRGB: u32, dfactorRGB: u32, sfactorAlpha: u32, dfactorAlpha: u32);
impl_MultiDrawArrays:   proc "c" (mode: u32, first: [^]i32, count: [^]i32, drawcount: i32);
impl_MultiDrawElements: proc "c" (mode: u32, count: [^]i32, type: u32, indices: [^]rawptr, drawcount: i32);
impl_PointParameterf:   proc "c" (pname: u32, param: f32);
impl_PointParameterfv:  proc "c" (pname: u32, params: [^]f32);
impl_PointParameteri:   proc "c" (pname: u32, param: i32);
impl_PointParameteriv:  proc "c" (pname: u32, params: [^]i32);
impl_BlendColor:        proc "c" (red: f32, green: f32, blue: f32, alpha: f32);
impl_BlendEquation:     proc "c" (mode: u32);


load_1_4 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_BlendFuncSeparate, "glBlendFuncSeparate");
	set_proc_address(&impl_MultiDrawArrays,   "glMultiDrawArrays");
	set_proc_address(&impl_MultiDrawElements, "glMultiDrawElements");
	set_proc_address(&impl_PointParameterf,   "glPointParameterf");
	set_proc_address(&impl_PointParameterfv,  "glPointParameterfv");
	set_proc_address(&impl_PointParameteri,   "glPointParameteri");
	set_proc_address(&impl_PointParameteriv,  "glPointParameteriv");
	set_proc_address(&impl_BlendColor,        "glBlendColor");
	set_proc_address(&impl_BlendEquation,     "glBlendEquation");
}


// VERSION_1_5
impl_GenQueries:           proc "c" (n: i32, ids: [^]u32);
impl_DeleteQueries:        proc "c" (n: i32, ids: [^]u32);
impl_IsQuery:              proc "c" (id: u32) -> bool;
impl_BeginQuery:           proc "c" (target: u32, id: u32);
impl_EndQuery:             proc "c" (target: u32);
impl_GetQueryiv:           proc "c" (target: u32, pname: u32, params: [^]i32);
impl_GetQueryObjectiv:     proc "c" (id: u32, pname: u32, params: [^]i32);
impl_GetQueryObjectuiv:    proc "c" (id: u32, pname: u32, params: [^]u32);
impl_BindBuffer:           proc "c" (target: u32, buffer: u32);
impl_DeleteBuffers:        proc "c" (n: i32, buffers: [^]u32);
impl_GenBuffers:           proc "c" (n: i32, buffers: [^]u32);
impl_IsBuffer:             proc "c" (buffer: u32) -> bool;
impl_BufferData:           proc "c" (target: u32, size: int, data: rawptr, usage: u32);
impl_BufferSubData:        proc "c" (target: u32, offset: int, size: int, data: rawptr);
impl_GetBufferSubData:     proc "c" (target: u32, offset: int, size: int, data: rawptr);
impl_MapBuffer:            proc "c" (target: u32, access: u32) -> rawptr;
impl_UnmapBuffer:          proc "c" (target: u32) -> bool;
impl_GetBufferParameteriv: proc "c" (target: u32, pname: u32, params: [^]i32);
impl_GetBufferPointerv:    proc "c" (target: u32, pname: u32, params: [^]rawptr);

load_1_5 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_GenQueries,           "glGenQueries");
	set_proc_address(&impl_DeleteQueries,        "glDeleteQueries");
	set_proc_address(&impl_IsQuery,              "glIsQuery");
	set_proc_address(&impl_BeginQuery,           "glBeginQuery");
	set_proc_address(&impl_EndQuery,             "glEndQuery");
	set_proc_address(&impl_GetQueryiv,           "glGetQueryiv");
	set_proc_address(&impl_GetQueryObjectiv,     "glGetQueryObjectiv");
	set_proc_address(&impl_GetQueryObjectuiv,    "glGetQueryObjectuiv");
	set_proc_address(&impl_BindBuffer,           "glBindBuffer");
	set_proc_address(&impl_DeleteBuffers,        "glDeleteBuffers");
	set_proc_address(&impl_GenBuffers,           "glGenBuffers");
	set_proc_address(&impl_IsBuffer,             "glIsBuffer");
	set_proc_address(&impl_BufferData,           "glBufferData");
	set_proc_address(&impl_BufferSubData,        "glBufferSubData");
	set_proc_address(&impl_GetBufferSubData,     "glGetBufferSubData");
	set_proc_address(&impl_MapBuffer,            "glMapBuffer");
	set_proc_address(&impl_UnmapBuffer,          "glUnmapBuffer");
	set_proc_address(&impl_GetBufferParameteriv, "glGetBufferParameteriv");
	set_proc_address(&impl_GetBufferPointerv,    "glGetBufferPointerv");
}


// VERSION_2_0
impl_BlendEquationSeparate:    proc "c" (modeRGB: u32, modeAlpha: u32);
impl_DrawBuffers:              proc "c" (n: i32, bufs: [^]u32);
impl_StencilOpSeparate:        proc "c" (face: u32, sfail: u32, dpfail: u32, dppass: u32);
impl_StencilFuncSeparate:      proc "c" (face: u32, func: u32, ref: i32, mask: u32);
impl_StencilMaskSeparate:      proc "c" (face: u32, mask: u32);
impl_AttachShader:             proc "c" (program: u32, shader: u32);
impl_BindAttribLocation:       proc "c" (program: u32, index: u32, name: cstring);
impl_CompileShader:            proc "c" (shader: u32);
impl_CreateProgram:            proc "c" () -> u32;
impl_CreateShader:             proc "c" (type: u32) -> u32;
impl_DeleteProgram:            proc "c" (program: u32);
impl_DeleteShader:             proc "c" (shader: u32);
impl_DetachShader:             proc "c" (program: u32, shader: u32);
impl_DisableVertexAttribArray: proc "c" (index: u32);
impl_EnableVertexAttribArray:  proc "c" (index: u32);
impl_GetActiveAttrib:          proc "c" (program: u32, index: u32, bufSize: i32, length: ^i32, size: ^i32, type: ^u32, name: [^]u8);
impl_GetActiveUniform:         proc "c" (program: u32, index: u32, bufSize: i32, length: ^i32, size: ^i32, type: ^u32, name: [^]u8);
impl_GetAttachedShaders:       proc "c" (program: u32, maxCount: i32, count: ^i32, shaders: ^u32);
impl_GetAttribLocation:        proc "c" (program: u32, name: cstring) -> i32;
impl_GetProgramiv:             proc "c" (program: u32, pname: u32, params: [^]i32);
impl_GetProgramInfoLog:        proc "c" (program: u32, bufSize: i32, length: ^i32, infoLog: ^u8);
impl_GetShaderiv:              proc "c" (shader: u32, pname: u32, params: [^]i32);
impl_GetShaderInfoLog:         proc "c" (shader: u32, bufSize: i32, length: ^i32, infoLog: ^u8);
impl_GetShaderSource:          proc "c" (shader: u32, bufSize: i32, length: ^i32, source: ^u8);
impl_GetUniformLocation:       proc "c" (program: u32, name: cstring) -> i32;
impl_GetUniformfv:             proc "c" (program: u32, location: i32, params: [^]f32);
impl_GetUniformiv:             proc "c" (program: u32, location: i32, params: [^]i32);
impl_GetVertexAttribdv:        proc "c" (index: u32, pname: u32, params: [^]f64);
impl_GetVertexAttribfv:        proc "c" (index: u32, pname: u32, params: [^]f32);
impl_GetVertexAttribiv:        proc "c" (index: u32, pname: u32, params: [^]i32);
impl_GetVertexAttribPointerv:  proc "c" (index: u32, pname: u32, pointer: ^rawptr);
impl_IsProgram:                proc "c" (program: u32) -> bool;
impl_IsShader:                 proc "c" (shader: u32) -> bool;
impl_LinkProgram:              proc "c" (program: u32);
impl_ShaderSource:             proc "c" (shader: u32, count: i32, string: [^]cstring, length: [^]i32);
impl_UseProgram:               proc "c" (program: u32);
impl_Uniform1f:                proc "c" (location: i32, v0: f32);
impl_Uniform2f:                proc "c" (location: i32, v0: f32, v1: f32);
impl_Uniform3f:                proc "c" (location: i32, v0: f32, v1: f32, v2: f32);
impl_Uniform4f:                proc "c" (location: i32, v0: f32, v1: f32, v2: f32, v3: f32);
impl_Uniform1i:                proc "c" (location: i32, v0: i32);
impl_Uniform2i:                proc "c" (location: i32, v0: i32, v1: i32);
impl_Uniform3i:                proc "c" (location: i32, v0: i32, v1: i32, v2: i32);
impl_Uniform4i:                proc "c" (location: i32, v0: i32, v1: i32, v2: i32, v3: i32);
impl_Uniform1fv:               proc "c" (location: i32, count: i32, value: [^]f32);
impl_Uniform2fv:               proc "c" (location: i32, count: i32, value: [^]f32);
impl_Uniform3fv:               proc "c" (location: i32, count: i32, value: [^]f32);
impl_Uniform4fv:               proc "c" (location: i32, count: i32, value: [^]f32);
impl_Uniform1iv:               proc "c" (location: i32, count: i32, value: [^]i32);
impl_Uniform2iv:               proc "c" (location: i32, count: i32, value: [^]i32);
impl_Uniform3iv:               proc "c" (location: i32, count: i32, value: [^]i32);
impl_Uniform4iv:               proc "c" (location: i32, count: i32, value: [^]i32);
impl_UniformMatrix2fv:         proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32);
impl_UniformMatrix3fv:         proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32);
impl_UniformMatrix4fv:         proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32);
impl_ValidateProgram:          proc "c" (program: u32);
impl_VertexAttrib1d:           proc "c" (index: u32, x: f64);
impl_VertexAttrib1dv:          proc "c" (index: u32, v: ^f64);
impl_VertexAttrib1f:           proc "c" (index: u32, x: f32);
impl_VertexAttrib1fv:          proc "c" (index: u32, v: ^f32);
impl_VertexAttrib1s:           proc "c" (index: u32, x: i16);
impl_VertexAttrib1sv:          proc "c" (index: u32, v: ^i16);
impl_VertexAttrib2d:           proc "c" (index: u32, x: f64, y: f64);
impl_VertexAttrib2dv:          proc "c" (index: u32, v: ^f64);
impl_VertexAttrib2f:           proc "c" (index: u32, x: f32, y: f32);
impl_VertexAttrib2fv:          proc "c" (index: u32, v: ^f32);
impl_VertexAttrib2s:           proc "c" (index: u32, x: i16, y: i16);
impl_VertexAttrib2sv:          proc "c" (index: u32, v: ^i16);
impl_VertexAttrib3d:           proc "c" (index: u32, x: f64, y: f64, z: f64);
impl_VertexAttrib3dv:          proc "c" (index: u32, v: ^f64);
impl_VertexAttrib3f:           proc "c" (index: u32, x: f32, y: f32, z: f32);
impl_VertexAttrib3fv:          proc "c" (index: u32, v: ^f32);
impl_VertexAttrib3s:           proc "c" (index: u32, x: i16, y: i16, z: i16);
impl_VertexAttrib3sv:          proc "c" (index: u32, v: ^i16);
impl_VertexAttrib4Nbv:         proc "c" (index: u32, v: ^i8);
impl_VertexAttrib4Niv:         proc "c" (index: u32, v: ^i32);
impl_VertexAttrib4Nsv:         proc "c" (index: u32, v: ^i16);
impl_VertexAttrib4Nub:         proc "c" (index: u32, x: u8, y: u8, z: u8, w: u8);
impl_VertexAttrib4Nubv:        proc "c" (index: u32, v: ^u8);
impl_VertexAttrib4Nuiv:        proc "c" (index: u32, v: ^u32);
impl_VertexAttrib4Nusv:        proc "c" (index: u32, v: ^u16);
impl_VertexAttrib4bv:          proc "c" (index: u32, v: ^i8);
impl_VertexAttrib4d:           proc "c" (index: u32, x: f64, y: f64, z: f64, w: f64);
impl_VertexAttrib4dv:          proc "c" (index: u32, v: ^f64);
impl_VertexAttrib4f:           proc "c" (index: u32, x: f32, y: f32, z: f32, w: f32);
impl_VertexAttrib4fv:          proc "c" (index: u32, v: ^f32);
impl_VertexAttrib4iv:          proc "c" (index: u32, v: ^i32);
impl_VertexAttrib4s:           proc "c" (index: u32, x: i16, y: i16, z: i16, w: i16);
impl_VertexAttrib4sv:          proc "c" (index: u32, v: ^i16);
impl_VertexAttrib4ubv:         proc "c" (index: u32, v: ^u8);
impl_VertexAttrib4uiv:         proc "c" (index: u32, v: ^u32);
impl_VertexAttrib4usv:         proc "c" (index: u32, v: ^u16);
impl_VertexAttribPointer:      proc "c" (index: u32, size: i32, type: u32, normalized: bool, stride: i32, pointer: rawptr);

load_2_0 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_BlendEquationSeparate,    "glBlendEquationSeparate");
	set_proc_address(&impl_DrawBuffers,              "glDrawBuffers");
	set_proc_address(&impl_StencilOpSeparate,        "glStencilOpSeparate");
	set_proc_address(&impl_StencilFuncSeparate,      "glStencilFuncSeparate");
	set_proc_address(&impl_StencilMaskSeparate,      "glStencilMaskSeparate");
	set_proc_address(&impl_AttachShader,             "glAttachShader");
	set_proc_address(&impl_BindAttribLocation,       "glBindAttribLocation");
	set_proc_address(&impl_CompileShader,            "glCompileShader");
	set_proc_address(&impl_CreateProgram,            "glCreateProgram");
	set_proc_address(&impl_CreateShader,             "glCreateShader");
	set_proc_address(&impl_DeleteProgram,            "glDeleteProgram");
	set_proc_address(&impl_DeleteShader,             "glDeleteShader");
	set_proc_address(&impl_DetachShader,             "glDetachShader");
	set_proc_address(&impl_DisableVertexAttribArray, "glDisableVertexAttribArray");
	set_proc_address(&impl_EnableVertexAttribArray,  "glEnableVertexAttribArray");
	set_proc_address(&impl_GetActiveAttrib,          "glGetActiveAttrib");
	set_proc_address(&impl_GetActiveUniform,         "glGetActiveUniform");
	set_proc_address(&impl_GetAttachedShaders,       "glGetAttachedShaders");
	set_proc_address(&impl_GetAttribLocation,        "glGetAttribLocation");
	set_proc_address(&impl_GetProgramiv,             "glGetProgramiv");
	set_proc_address(&impl_GetProgramInfoLog,        "glGetProgramInfoLog");
	set_proc_address(&impl_GetShaderiv,              "glGetShaderiv");
	set_proc_address(&impl_GetShaderInfoLog,         "glGetShaderInfoLog");
	set_proc_address(&impl_GetShaderSource,          "glGetShaderSource");
	set_proc_address(&impl_GetUniformLocation,       "glGetUniformLocation");
	set_proc_address(&impl_GetUniformfv,             "glGetUniformfv");
	set_proc_address(&impl_GetUniformiv,             "glGetUniformiv");
	set_proc_address(&impl_GetVertexAttribdv,        "glGetVertexAttribdv");
	set_proc_address(&impl_GetVertexAttribfv,        "glGetVertexAttribfv");
	set_proc_address(&impl_GetVertexAttribiv,        "glGetVertexAttribiv");
	set_proc_address(&impl_GetVertexAttribPointerv,  "glGetVertexAttribPointerv");
	set_proc_address(&impl_IsProgram,                "glIsProgram");
	set_proc_address(&impl_IsShader,                 "glIsShader");
	set_proc_address(&impl_LinkProgram,              "glLinkProgram");
	set_proc_address(&impl_ShaderSource,             "glShaderSource");
	set_proc_address(&impl_UseProgram,               "glUseProgram");
	set_proc_address(&impl_Uniform1f,                "glUniform1f");
	set_proc_address(&impl_Uniform2f,                "glUniform2f");
	set_proc_address(&impl_Uniform3f,                "glUniform3f");
	set_proc_address(&impl_Uniform4f,                "glUniform4f");
	set_proc_address(&impl_Uniform1i,                "glUniform1i");
	set_proc_address(&impl_Uniform2i,                "glUniform2i");
	set_proc_address(&impl_Uniform3i,                "glUniform3i");
	set_proc_address(&impl_Uniform4i,                "glUniform4i");
	set_proc_address(&impl_Uniform1fv,               "glUniform1fv");
	set_proc_address(&impl_Uniform2fv,               "glUniform2fv");
	set_proc_address(&impl_Uniform3fv,               "glUniform3fv");
	set_proc_address(&impl_Uniform4fv,               "glUniform4fv");
	set_proc_address(&impl_Uniform1iv,               "glUniform1iv");
	set_proc_address(&impl_Uniform2iv,               "glUniform2iv");
	set_proc_address(&impl_Uniform3iv,               "glUniform3iv");
	set_proc_address(&impl_Uniform4iv,               "glUniform4iv");
	set_proc_address(&impl_UniformMatrix2fv,         "glUniformMatrix2fv");
	set_proc_address(&impl_UniformMatrix3fv,         "glUniformMatrix3fv");
	set_proc_address(&impl_UniformMatrix4fv,         "glUniformMatrix4fv");
	set_proc_address(&impl_ValidateProgram,          "glValidateProgram");
	set_proc_address(&impl_VertexAttrib1d,           "glVertexAttrib1d");
	set_proc_address(&impl_VertexAttrib1dv,          "glVertexAttrib1dv");
	set_proc_address(&impl_VertexAttrib1f,           "glVertexAttrib1f");
	set_proc_address(&impl_VertexAttrib1fv,          "glVertexAttrib1fv");
	set_proc_address(&impl_VertexAttrib1s,           "glVertexAttrib1s");
	set_proc_address(&impl_VertexAttrib1sv,          "glVertexAttrib1sv");
	set_proc_address(&impl_VertexAttrib2d,           "glVertexAttrib2d");
	set_proc_address(&impl_VertexAttrib2dv,          "glVertexAttrib2dv");
	set_proc_address(&impl_VertexAttrib2f,           "glVertexAttrib2f");
	set_proc_address(&impl_VertexAttrib2fv,          "glVertexAttrib2fv");
	set_proc_address(&impl_VertexAttrib2s,           "glVertexAttrib2s");
	set_proc_address(&impl_VertexAttrib2sv,          "glVertexAttrib2sv");
	set_proc_address(&impl_VertexAttrib3d,           "glVertexAttrib3d");
	set_proc_address(&impl_VertexAttrib3dv,          "glVertexAttrib3dv");
	set_proc_address(&impl_VertexAttrib3f,           "glVertexAttrib3f");
	set_proc_address(&impl_VertexAttrib3fv,          "glVertexAttrib3fv");
	set_proc_address(&impl_VertexAttrib3s,           "glVertexAttrib3s");
	set_proc_address(&impl_VertexAttrib3sv,          "glVertexAttrib3sv");
	set_proc_address(&impl_VertexAttrib4Nbv,         "glVertexAttrib4Nbv");
	set_proc_address(&impl_VertexAttrib4Niv,         "glVertexAttrib4Niv");
	set_proc_address(&impl_VertexAttrib4Nsv,         "glVertexAttrib4Nsv");
	set_proc_address(&impl_VertexAttrib4Nub,         "glVertexAttrib4Nub");
	set_proc_address(&impl_VertexAttrib4Nubv,        "glVertexAttrib4Nubv");
	set_proc_address(&impl_VertexAttrib4Nuiv,        "glVertexAttrib4Nuiv");
	set_proc_address(&impl_VertexAttrib4Nusv,        "glVertexAttrib4Nusv");
	set_proc_address(&impl_VertexAttrib4bv,          "glVertexAttrib4bv");
	set_proc_address(&impl_VertexAttrib4d,           "glVertexAttrib4d");
	set_proc_address(&impl_VertexAttrib4dv,          "glVertexAttrib4dv");
	set_proc_address(&impl_VertexAttrib4f,           "glVertexAttrib4f");
	set_proc_address(&impl_VertexAttrib4fv,          "glVertexAttrib4fv");
	set_proc_address(&impl_VertexAttrib4iv,          "glVertexAttrib4iv");
	set_proc_address(&impl_VertexAttrib4s,           "glVertexAttrib4s");
	set_proc_address(&impl_VertexAttrib4sv,          "glVertexAttrib4sv");
	set_proc_address(&impl_VertexAttrib4ubv,         "glVertexAttrib4ubv");
	set_proc_address(&impl_VertexAttrib4uiv,         "glVertexAttrib4uiv");
	set_proc_address(&impl_VertexAttrib4usv,         "glVertexAttrib4usv");
	set_proc_address(&impl_VertexAttribPointer,      "glVertexAttribPointer");
}


// VERSION_2_1
impl_UniformMatrix2x3fv: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32);
impl_UniformMatrix3x2fv: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32);
impl_UniformMatrix2x4fv: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32);
impl_UniformMatrix4x2fv: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32);
impl_UniformMatrix3x4fv: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32);
impl_UniformMatrix4x3fv: proc "c" (location: i32, count: i32, transpose: bool, value: [^]f32);

load_2_1 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_UniformMatrix2x3fv, "glUniformMatrix2x3fv");
	set_proc_address(&impl_UniformMatrix3x2fv, "glUniformMatrix3x2fv");
	set_proc_address(&impl_UniformMatrix2x4fv, "glUniformMatrix2x4fv");
	set_proc_address(&impl_UniformMatrix4x2fv, "glUniformMatrix4x2fv");
	set_proc_address(&impl_UniformMatrix3x4fv, "glUniformMatrix3x4fv");
	set_proc_address(&impl_UniformMatrix4x3fv, "glUniformMatrix4x3fv");
}


// VERSION_3_0
 impl_ColorMaski:                          proc "c" (index: u32, r: u8, g: u8, b: u8, a: u8);
 impl_GetBooleani_v:                       proc "c" (target: u32, index: u32, data: ^bool);
 impl_GetIntegeri_v:                       proc "c" (target: u32, index: u32, data: ^i32);
 impl_Enablei:                             proc "c" (target: u32, index: u32);
 impl_Disablei:                            proc "c" (target: u32, index: u32);
 impl_IsEnabledi:                          proc "c" (target: u32, index: u32) -> bool;
 impl_BeginTransformFeedback:              proc "c" (primitiveMode: u32);
 impl_EndTransformFeedback:                proc "c" ();
 impl_BindBufferRange:                     proc "c" (target: u32, index: u32, buffer: u32, offset: int, size: int);
 impl_BindBufferBase:                      proc "c" (target: u32, index: u32, buffer: u32);
 impl_TransformFeedbackVaryings:           proc "c" (program: u32, count: i32, varyings: [^]cstring, bufferMode: u32);
 impl_GetTransformFeedbackVarying:         proc "c" (program: u32, index: u32, bufSize: i32, length: ^i32, size: ^i32, type: ^u32, name: [^]u8);
 impl_ClampColor:                          proc "c" (target: u32, clamp: u32);
 impl_BeginConditionalRender:              proc "c" (id: u32, mode: u32);
 impl_EndConditionalRender:                proc "c" ();
 impl_VertexAttribIPointer:                proc "c" (index: u32, size: i32, type: u32, stride: i32, pointer: rawptr);
 impl_GetVertexAttribIiv:                  proc "c" (index: u32, pname: u32, params: [^]i32);
 impl_GetVertexAttribIuiv:                 proc "c" (index: u32, pname: u32, params: [^]u32);
 impl_VertexAttribI1i:                     proc "c" (index: u32, x: i32);
 impl_VertexAttribI2i:                     proc "c" (index: u32, x: i32, y: i32);
 impl_VertexAttribI3i:                     proc "c" (index: u32, x: i32, y: i32, z: i32);
 impl_VertexAttribI4i:                     proc "c" (index: u32, x: i32, y: i32, z: i32, w: i32);
 impl_VertexAttribI1ui:                    proc "c" (index: u32, x: u32);
 impl_VertexAttribI2ui:                    proc "c" (index: u32, x: u32, y: u32);
 impl_VertexAttribI3ui:                    proc "c" (index: u32, x: u32, y: u32, z: u32);
 impl_VertexAttribI4ui:                    proc "c" (index: u32, x: u32, y: u32, z: u32, w: u32);
 impl_VertexAttribI1iv:                    proc "c" (index: u32, v: ^i32);
 impl_VertexAttribI2iv:                    proc "c" (index: u32, v: ^i32);
 impl_VertexAttribI3iv:                    proc "c" (index: u32, v: ^i32);
 impl_VertexAttribI4iv:                    proc "c" (index: u32, v: ^i32);
 impl_VertexAttribI1uiv:                   proc "c" (index: u32, v: ^u32);
 impl_VertexAttribI2uiv:                   proc "c" (index: u32, v: ^u32);
 impl_VertexAttribI3uiv:                   proc "c" (index: u32, v: ^u32);
 impl_VertexAttribI4uiv:                   proc "c" (index: u32, v: ^u32);
 impl_VertexAttribI4bv:                    proc "c" (index: u32, v: ^i8);
 impl_VertexAttribI4sv:                    proc "c" (index: u32, v: ^i16);
 impl_VertexAttribI4ubv:                   proc "c" (index: u32, v: ^u8);
 impl_VertexAttribI4usv:                   proc "c" (index: u32, v: ^u16);
 impl_GetUniformuiv:                       proc "c" (program: u32, location: i32, params: [^]u32);
 impl_BindFragDataLocation:                proc "c" (program: u32, color: u32, name: cstring);
 impl_GetFragDataLocation:                 proc "c" (program: u32, name: cstring) -> i32;
 impl_Uniform1ui:                          proc "c" (location: i32, v0: u32);
 impl_Uniform2ui:                          proc "c" (location: i32, v0: u32, v1: u32);
 impl_Uniform3ui:                          proc "c" (location: i32, v0: u32, v1: u32, v2: u32);
 impl_Uniform4ui:                          proc "c" (location: i32, v0: u32, v1: u32, v2: u32, v3: u32);
 impl_Uniform1uiv:                         proc "c" (location: i32, count: i32, value: [^]u32);
 impl_Uniform2uiv:                         proc "c" (location: i32, count: i32, value: [^]u32);
 impl_Uniform3uiv:                         proc "c" (location: i32, count: i32, value: [^]u32);
 impl_Uniform4uiv:                         proc "c" (location: i32, count: i32, value: [^]u32);
 impl_TexParameterIiv:                     proc "c" (target: u32, pname: u32, params: [^]i32);
 impl_TexParameterIuiv:                    proc "c" (target: u32, pname: u32, params: [^]u32);
 impl_GetTexParameterIiv:                  proc "c" (target: u32, pname: u32, params: [^]i32);
 impl_GetTexParameterIuiv:                 proc "c" (target: u32, pname: u32, params: [^]u32);
 impl_ClearBufferiv:                       proc "c" (buffer: u32, drawbuffer: i32, value: ^i32);
 impl_ClearBufferuiv:                      proc "c" (buffer: u32, drawbuffer: i32, value: ^u32);
 impl_ClearBufferfv:                       proc "c" (buffer: u32, drawbuffer: i32, value: ^f32);
 impl_ClearBufferfi:                       proc "c" (buffer: u32, drawbuffer: i32, depth: f32, stencil: i32) -> rawptr;
 impl_GetStringi:                          proc "c" (name: u32, index: u32) -> cstring;
 impl_IsRenderbuffer:                      proc "c" (renderbuffer: u32) -> bool;
 impl_BindRenderbuffer:                    proc "c" (target: u32, renderbuffer: u32);
 impl_DeleteRenderbuffers:                 proc "c" (n: i32, renderbuffers: [^]u32);
 impl_GenRenderbuffers:                    proc "c" (n: i32, renderbuffers: [^]u32);
 impl_RenderbufferStorage:                 proc "c" (target: u32, internalformat: u32, width: i32, height: i32);
 impl_GetRenderbufferParameteriv:          proc "c" (target: u32, pname: u32, params: [^]i32);
 impl_IsFramebuffer:                       proc "c" (framebuffer: u32) -> bool;
 impl_BindFramebuffer:                     proc "c" (target: u32, framebuffer: u32);
 impl_DeleteFramebuffers:                  proc "c" (n: i32, framebuffers: [^]u32);
 impl_GenFramebuffers:                     proc "c" (n: i32, framebuffers: [^]u32);
 impl_CheckFramebufferStatus:              proc "c" (target: u32) -> u32;
 impl_FramebufferTexture1D:                proc "c" (target: u32, attachment: u32, textarget: u32, texture: u32, level: i32);
 impl_FramebufferTexture2D:                proc "c" (target: u32, attachment: u32, textarget: u32, texture: u32, level: i32);
 impl_FramebufferTexture3D:                proc "c" (target: u32, attachment: u32, textarget: u32, texture: u32, level: i32, zoffset: i32);
 impl_FramebufferRenderbuffer:             proc "c" (target: u32, attachment: u32, renderbuffertarget: u32, renderbuffer: u32);
 impl_GetFramebufferAttachmentParameteriv: proc "c" (target: u32, attachment: u32, pname: u32, params: [^]i32);
 impl_GenerateMipmap:                      proc "c" (target: u32);
 impl_BlitFramebuffer:                     proc "c" (srcX0: i32, srcY0: i32, srcX1: i32, srcY1: i32, dstX0: i32, dstY0: i32, dstX1: i32, dstY1: i32, mask: u32, filter: u32);
 impl_RenderbufferStorageMultisample:      proc "c" (target: u32, samples: i32, internalformat: u32, width: i32, height: i32);
 impl_FramebufferTextureLayer:             proc "c" (target: u32, attachment: u32, texture: u32, level: i32, layer: i32);
 impl_MapBufferRange:                      proc "c" (target: u32, offset: int, length: int, access: u32) -> rawptr;
 impl_FlushMappedBufferRange:              proc "c" (target: u32, offset: int, length: int);
 impl_BindVertexArray:                     proc "c" (array: u32);
 impl_DeleteVertexArrays:                  proc "c" (n: i32, arrays: [^]u32);
 impl_GenVertexArrays:                     proc "c" (n: i32, arrays: [^]u32);
 impl_IsVertexArray:                       proc "c" (array: u32) -> bool;

load_3_0 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_ColorMaski,                          "glColorMaski");
	set_proc_address(&impl_GetBooleani_v,                       "glGetBooleani_v");
	set_proc_address(&impl_GetIntegeri_v,                       "glGetIntegeri_v");
	set_proc_address(&impl_Enablei,                             "glEnablei");
	set_proc_address(&impl_Disablei,                            "glDisablei");
	set_proc_address(&impl_IsEnabledi,                          "glIsEnabledi");
	set_proc_address(&impl_BeginTransformFeedback,              "glBeginTransformFeedback");
	set_proc_address(&impl_EndTransformFeedback,                "glEndTransformFeedback");
	set_proc_address(&impl_BindBufferRange,                     "glBindBufferRange");
	set_proc_address(&impl_BindBufferBase,                      "glBindBufferBase");
	set_proc_address(&impl_TransformFeedbackVaryings,           "glTransformFeedbackVaryings");
	set_proc_address(&impl_GetTransformFeedbackVarying,         "glGetTransformFeedbackVarying");
	set_proc_address(&impl_ClampColor,                          "glClampColor");
	set_proc_address(&impl_BeginConditionalRender,              "glBeginConditionalRender");
	set_proc_address(&impl_EndConditionalRender,                "glEndConditionalRender");
	set_proc_address(&impl_VertexAttribIPointer,                "glVertexAttribIPointer");
	set_proc_address(&impl_GetVertexAttribIiv,                  "glGetVertexAttribIiv");
	set_proc_address(&impl_GetVertexAttribIuiv,                 "glGetVertexAttribIuiv");
	set_proc_address(&impl_VertexAttribI1i,                     "glVertexAttribI1i");
	set_proc_address(&impl_VertexAttribI2i,                     "glVertexAttribI2i");
	set_proc_address(&impl_VertexAttribI3i,                     "glVertexAttribI3i");
	set_proc_address(&impl_VertexAttribI4i,                     "glVertexAttribI4i");
	set_proc_address(&impl_VertexAttribI1ui,                    "glVertexAttribI1ui");
	set_proc_address(&impl_VertexAttribI2ui,                    "glVertexAttribI2ui");
	set_proc_address(&impl_VertexAttribI3ui,                    "glVertexAttribI3ui");
	set_proc_address(&impl_VertexAttribI4ui,                    "glVertexAttribI4ui");
	set_proc_address(&impl_VertexAttribI1iv,                    "glVertexAttribI1iv");
	set_proc_address(&impl_VertexAttribI2iv,                    "glVertexAttribI2iv");
	set_proc_address(&impl_VertexAttribI3iv,                    "glVertexAttribI3iv");
	set_proc_address(&impl_VertexAttribI4iv,                    "glVertexAttribI4iv");
	set_proc_address(&impl_VertexAttribI1uiv,                   "glVertexAttribI1uiv");
	set_proc_address(&impl_VertexAttribI2uiv,                   "glVertexAttribI2uiv");
	set_proc_address(&impl_VertexAttribI3uiv,                   "glVertexAttribI3uiv");
	set_proc_address(&impl_VertexAttribI4uiv,                   "glVertexAttribI4uiv");
	set_proc_address(&impl_VertexAttribI4bv,                    "glVertexAttribI4bv");
	set_proc_address(&impl_VertexAttribI4sv,                    "glVertexAttribI4sv");
	set_proc_address(&impl_VertexAttribI4ubv,                   "glVertexAttribI4ubv");
	set_proc_address(&impl_VertexAttribI4usv,                   "glVertexAttribI4usv");
	set_proc_address(&impl_GetUniformuiv,                       "glGetUniformuiv");
	set_proc_address(&impl_BindFragDataLocation,                "glBindFragDataLocation");
	set_proc_address(&impl_GetFragDataLocation,                 "glGetFragDataLocation");
	set_proc_address(&impl_Uniform1ui,                          "glUniform1ui");
	set_proc_address(&impl_Uniform2ui,                          "glUniform2ui");
	set_proc_address(&impl_Uniform3ui,                          "glUniform3ui");
	set_proc_address(&impl_Uniform4ui,                          "glUniform4ui");
	set_proc_address(&impl_Uniform1uiv,                         "glUniform1uiv");
	set_proc_address(&impl_Uniform2uiv,                         "glUniform2uiv");
	set_proc_address(&impl_Uniform3uiv,                         "glUniform3uiv");
	set_proc_address(&impl_Uniform4uiv,                         "glUniform4uiv");
	set_proc_address(&impl_TexParameterIiv,                     "glTexParameterIiv");
	set_proc_address(&impl_TexParameterIuiv,                    "glTexParameterIuiv");
	set_proc_address(&impl_GetTexParameterIiv,                  "glGetTexParameterIiv");
	set_proc_address(&impl_GetTexParameterIuiv,                 "glGetTexParameterIuiv");
	set_proc_address(&impl_ClearBufferiv,                       "glClearBufferiv");
	set_proc_address(&impl_ClearBufferuiv,                      "glClearBufferuiv");
	set_proc_address(&impl_ClearBufferfv,                       "glClearBufferfv");
	set_proc_address(&impl_ClearBufferfi,                       "glClearBufferfi");
	set_proc_address(&impl_GetStringi,                          "glGetStringi");
	set_proc_address(&impl_IsRenderbuffer,                      "glIsRenderbuffer");
	set_proc_address(&impl_BindRenderbuffer,                    "glBindRenderbuffer");
	set_proc_address(&impl_DeleteRenderbuffers,                 "glDeleteRenderbuffers");
	set_proc_address(&impl_GenRenderbuffers,                    "glGenRenderbuffers");
	set_proc_address(&impl_RenderbufferStorage,                 "glRenderbufferStorage");
	set_proc_address(&impl_GetRenderbufferParameteriv,          "glGetRenderbufferParameteriv");
	set_proc_address(&impl_IsFramebuffer,                       "glIsFramebuffer");
	set_proc_address(&impl_BindFramebuffer,                     "glBindFramebuffer");
	set_proc_address(&impl_DeleteFramebuffers,                  "glDeleteFramebuffers");
	set_proc_address(&impl_GenFramebuffers,                     "glGenFramebuffers");
	set_proc_address(&impl_CheckFramebufferStatus,              "glCheckFramebufferStatus");
	set_proc_address(&impl_FramebufferTexture1D,                "glFramebufferTexture1D");
	set_proc_address(&impl_FramebufferTexture2D,                "glFramebufferTexture2D");
	set_proc_address(&impl_FramebufferTexture3D,                "glFramebufferTexture3D");
	set_proc_address(&impl_FramebufferRenderbuffer,             "glFramebufferRenderbuffer");
	set_proc_address(&impl_GetFramebufferAttachmentParameteriv, "glGetFramebufferAttachmentParameteriv");
	set_proc_address(&impl_GenerateMipmap,                      "glGenerateMipmap");
	set_proc_address(&impl_BlitFramebuffer,                     "glBlitFramebuffer");
	set_proc_address(&impl_RenderbufferStorageMultisample,      "glRenderbufferStorageMultisample");
	set_proc_address(&impl_FramebufferTextureLayer,             "glFramebufferTextureLayer");
	set_proc_address(&impl_MapBufferRange,                      "glMapBufferRange");
	set_proc_address(&impl_FlushMappedBufferRange,              "glFlushMappedBufferRange");
	set_proc_address(&impl_BindVertexArray,                     "glBindVertexArray");
	set_proc_address(&impl_DeleteVertexArrays,                  "glDeleteVertexArrays");
	set_proc_address(&impl_GenVertexArrays,                     "glGenVertexArrays");
	set_proc_address(&impl_IsVertexArray,                       "glIsVertexArray");
}


// VERSION_3_1
impl_DrawArraysInstanced:       proc "c" (mode: u32, first: i32, count: i32, instancecount: i32);
impl_DrawElementsInstanced:     proc "c" (mode: u32, count: i32, type: u32, indices: rawptr, instancecount: i32);
impl_TexBuffer:                 proc "c" (target: u32, internalformat: u32, buffer: u32);
impl_PrimitiveRestartIndex:     proc "c" (index: u32);
impl_CopyBufferSubData:         proc "c" (readTarget: u32, writeTarget: u32, readOffset: int, writeOffset: int, size: int);
impl_GetUniformIndices:         proc "c" (program: u32, uniformCount: i32, uniformNames: [^]cstring, uniformIndices: [^]u32);
impl_GetActiveUniformsiv:       proc "c" (program: u32, uniformCount: i32, uniformIndices: [^]u32, pname: u32, params: [^]i32);
impl_GetActiveUniformName:      proc "c" (program: u32, uniformIndex: u32, bufSize: i32, length: ^i32, uniformName: [^]u8);
impl_GetUniformBlockIndex:      proc "c" (program: u32, uniformBlockName: cstring) -> u32;
impl_GetActiveUniformBlockiv:   proc "c" (program: u32, uniformBlockIndex: u32, pname: u32, params: [^]i32);
impl_GetActiveUniformBlockName: proc "c" (program: u32, uniformBlockIndex: u32, bufSize: i32, length: ^i32, uniformBlockName: [^]u8);
impl_UniformBlockBinding:       proc "c" (program: u32, uniformBlockIndex: u32, uniformBlockBinding: u32);

load_3_1 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_DrawArraysInstanced,       "glDrawArraysInstanced");
	set_proc_address(&impl_DrawElementsInstanced,     "glDrawElementsInstanced");
	set_proc_address(&impl_TexBuffer,                 "glTexBuffer");
	set_proc_address(&impl_PrimitiveRestartIndex,     "glPrimitiveRestartIndex");
	set_proc_address(&impl_CopyBufferSubData,         "glCopyBufferSubData");
	set_proc_address(&impl_GetUniformIndices,         "glGetUniformIndices");
	set_proc_address(&impl_GetActiveUniformsiv,       "glGetActiveUniformsiv");
	set_proc_address(&impl_GetActiveUniformName,      "glGetActiveUniformName");
	set_proc_address(&impl_GetUniformBlockIndex,      "glGetUniformBlockIndex");
	set_proc_address(&impl_GetActiveUniformBlockiv,   "glGetActiveUniformBlockiv");
	set_proc_address(&impl_GetActiveUniformBlockName, "glGetActiveUniformBlockName");
	set_proc_address(&impl_UniformBlockBinding,       "glUniformBlockBinding");
}


// VERSION_3_2
impl_DrawElementsBaseVertex:          proc "c" (mode: u32, count: i32, type: u32, indices: rawptr, basevertex: i32);
impl_DrawRangeElementsBaseVertex:     proc "c" (mode: u32, start: u32, end: u32, count: i32, type: u32, indices: rawptr, basevertex: i32);
impl_DrawElementsInstancedBaseVertex: proc "c" (mode: u32, count: i32, type: u32, indices: rawptr, instancecount: i32, basevertex: i32);
impl_MultiDrawElementsBaseVertex:     proc "c" (mode: u32, count: ^i32, type: u32, indices: [^]rawptr, drawcount: i32, basevertex: ^i32);
impl_ProvokingVertex:                 proc "c" (mode: u32);
impl_FenceSync:                       proc "c" (condition: u32, flags: u32) -> sync_t;
impl_IsSync:                          proc "c" (sync: sync_t) -> bool;
impl_DeleteSync:                      proc "c" (sync: sync_t);
impl_ClientWaitSync:                  proc "c" (sync: sync_t, flags: u32, timeout: u64) -> u32;
impl_WaitSync:                        proc "c" (sync: sync_t, flags: u32, timeout: u64);
impl_GetInteger64v:                   proc "c" (pname: u32, data: ^i64);
impl_GetSynciv:                       proc "c" (sync: sync_t, pname: u32, bufSize: i32, length: ^i32, values: [^]i32);
impl_GetInteger64i_v:                 proc "c" (target: u32, index: u32, data: ^i64);
impl_GetBufferParameteri64v:          proc "c" (target: u32, pname: u32, params: [^]i64);
impl_FramebufferTexture:              proc "c" (target: u32, attachment: u32, texture: u32, level: i32);
impl_TexImage2DMultisample:           proc "c" (target: u32, samples: i32, internalformat: u32, width: i32, height: i32, fixedsamplelocations: u8);
impl_TexImage3DMultisample:           proc "c" (target: u32, samples: i32, internalformat: u32, width: i32, height: i32, depth: i32, fixedsamplelocations: u8);
impl_GetMultisamplefv:                proc "c" (pname: u32, index: u32, val: ^f32);
impl_SampleMaski:                     proc "c" (maskNumber: u32, mask: u32);

load_3_2 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_DrawElementsBaseVertex,          "glDrawElementsBaseVertex");
	set_proc_address(&impl_DrawRangeElementsBaseVertex,     "glDrawRangeElementsBaseVertex");
	set_proc_address(&impl_DrawElementsInstancedBaseVertex, "glDrawElementsInstancedBaseVertex");
	set_proc_address(&impl_MultiDrawElementsBaseVertex,     "glMultiDrawElementsBaseVertex");
	set_proc_address(&impl_ProvokingVertex,                 "glProvokingVertex");
	set_proc_address(&impl_FenceSync,                       "glFenceSync");
	set_proc_address(&impl_IsSync,                          "glIsSync");
	set_proc_address(&impl_DeleteSync,                      "glDeleteSync");
	set_proc_address(&impl_ClientWaitSync,                  "glClientWaitSync");
	set_proc_address(&impl_WaitSync,                        "glWaitSync");
	set_proc_address(&impl_GetInteger64v,                   "glGetInteger64v");
	set_proc_address(&impl_GetSynciv,                       "glGetSynciv");
	set_proc_address(&impl_GetInteger64i_v,                 "glGetInteger64i_v");
	set_proc_address(&impl_GetBufferParameteri64v,          "glGetBufferParameteri64v");
	set_proc_address(&impl_FramebufferTexture,              "glFramebufferTexture");
	set_proc_address(&impl_TexImage2DMultisample,           "glTexImage2DMultisample");
	set_proc_address(&impl_TexImage3DMultisample,           "glTexImage3DMultisample");
	set_proc_address(&impl_GetMultisamplefv,                "glGetMultisamplefv");
	set_proc_address(&impl_SampleMaski,                     "glSampleMaski");
}


// VERSION_3_3
impl_BindFragDataLocationIndexed: proc "c" (program: u32, colorNumber: u32, index: u32, name: cstring);
impl_GetFragDataIndex:            proc "c" (program: u32, name: cstring) -> i32;
impl_GenSamplers:                 proc "c" (count: i32, samplers: [^]u32);
impl_DeleteSamplers:              proc "c" (count: i32, samplers: [^]u32);
impl_IsSampler:                   proc "c" (sampler: u32) -> bool;
impl_BindSampler:                 proc "c" (unit: u32, sampler: u32);
impl_SamplerParameteri:           proc "c" (sampler: u32, pname: u32, param: i32);
impl_SamplerParameteriv:          proc "c" (sampler: u32, pname: u32, param: ^i32);
impl_SamplerParameterf:           proc "c" (sampler: u32, pname: u32, param: f32);
impl_SamplerParameterfv:          proc "c" (sampler: u32, pname: u32, param: ^f32);
impl_SamplerParameterIiv:         proc "c" (sampler: u32, pname: u32, param: ^i32);
impl_SamplerParameterIuiv:        proc "c" (sampler: u32, pname: u32, param: ^u32);
impl_GetSamplerParameteriv:       proc "c" (sampler: u32, pname: u32, params: [^]i32);
impl_GetSamplerParameterIiv:      proc "c" (sampler: u32, pname: u32, params: [^]i32);
impl_GetSamplerParameterfv:       proc "c" (sampler: u32, pname: u32, params: [^]f32);
impl_GetSamplerParameterIuiv:     proc "c" (sampler: u32, pname: u32, params: [^]u32);
impl_QueryCounter:                proc "c" (id: u32, target: u32);
impl_GetQueryObjecti64v:          proc "c" (id: u32, pname: u32, params: [^]i64);
impl_GetQueryObjectui64v:         proc "c" (id: u32, pname: u32, params: [^]u64);
impl_VertexAttribDivisor:         proc "c" (index: u32, divisor: u32);
impl_VertexAttribP1ui:            proc "c" (index: u32, type: u32, normalized: bool, value: u32);
impl_VertexAttribP1uiv:           proc "c" (index: u32, type: u32, normalized: bool, value: ^u32);
impl_VertexAttribP2ui:            proc "c" (index: u32, type: u32, normalized: bool, value: u32);
impl_VertexAttribP2uiv:           proc "c" (index: u32, type: u32, normalized: bool, value: ^u32);
impl_VertexAttribP3ui:            proc "c" (index: u32, type: u32, normalized: bool, value: u32);
impl_VertexAttribP3uiv:           proc "c" (index: u32, type: u32, normalized: bool, value: ^u32);
impl_VertexAttribP4ui:            proc "c" (index: u32, type: u32, normalized: bool, value: u32);
impl_VertexAttribP4uiv:           proc "c" (index: u32, type: u32, normalized: bool, value: ^u32);
impl_VertexP2ui:                  proc "c" (type: u32, value: u32);
impl_VertexP2uiv:                 proc "c" (type: u32, value: ^u32);
impl_VertexP3ui:                  proc "c" (type: u32, value: u32);
impl_VertexP3uiv:                 proc "c" (type: u32, value: ^u32);
impl_VertexP4ui:                  proc "c" (type: u32, value: u32);
impl_VertexP4uiv:                 proc "c" (type: u32, value: ^u32);
impl_TexCoordP1ui:                proc "c" (type: u32, coords: u32);
impl_TexCoordP1uiv:               proc "c" (type: u32, coords: [^]u32);
impl_TexCoordP2ui:                proc "c" (type: u32, coords: u32);
impl_TexCoordP2uiv:               proc "c" (type: u32, coords: [^]u32);
impl_TexCoordP3ui:                proc "c" (type: u32, coords: u32);
impl_TexCoordP3uiv:               proc "c" (type: u32, coords: [^]u32);
impl_TexCoordP4ui:                proc "c" (type: u32, coords: u32);
impl_TexCoordP4uiv:               proc "c" (type: u32, coords: [^]u32);
impl_MultiTexCoordP1ui:           proc "c" (texture: u32, type: u32, coords: u32);
impl_MultiTexCoordP1uiv:          proc "c" (texture: u32, type: u32, coords: [^]u32);
impl_MultiTexCoordP2ui:           proc "c" (texture: u32, type: u32, coords: u32);
impl_MultiTexCoordP2uiv:          proc "c" (texture: u32, type: u32, coords: [^]u32);
impl_MultiTexCoordP3ui:           proc "c" (texture: u32, type: u32, coords: u32);
impl_MultiTexCoordP3uiv:          proc "c" (texture: u32, type: u32, coords: [^]u32);
impl_MultiTexCoordP4ui:           proc "c" (texture: u32, type: u32, coords: u32);
impl_MultiTexCoordP4uiv:          proc "c" (texture: u32, type: u32, coords: [^]u32);
impl_NormalP3ui:                  proc "c" (type: u32, coords: u32);
impl_NormalP3uiv:                 proc "c" (type: u32, coords: [^]u32);
impl_ColorP3ui:                   proc "c" (type: u32, color: u32);
impl_ColorP3uiv:                  proc "c" (type: u32, color: ^u32);
impl_ColorP4ui:                   proc "c" (type: u32, color: u32);
impl_ColorP4uiv:                  proc "c" (type: u32, color: ^u32);
impl_SecondaryColorP3ui:          proc "c" (type: u32, color: u32);
impl_SecondaryColorP3uiv:         proc "c" (type: u32, color: ^u32);

load_3_3 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_BindFragDataLocationIndexed, "glBindFragDataLocationIndexed");
	set_proc_address(&impl_GetFragDataIndex,            "glGetFragDataIndex");
	set_proc_address(&impl_GenSamplers,                 "glGenSamplers");
	set_proc_address(&impl_DeleteSamplers,              "glDeleteSamplers");
	set_proc_address(&impl_IsSampler,                   "glIsSampler");
	set_proc_address(&impl_BindSampler,                 "glBindSampler");
	set_proc_address(&impl_SamplerParameteri,           "glSamplerParameteri");
	set_proc_address(&impl_SamplerParameteriv,          "glSamplerParameteriv");
	set_proc_address(&impl_SamplerParameterf,           "glSamplerParameterf");
	set_proc_address(&impl_SamplerParameterfv,          "glSamplerParameterfv");
	set_proc_address(&impl_SamplerParameterIiv,         "glSamplerParameterIiv");
	set_proc_address(&impl_SamplerParameterIuiv,        "glSamplerParameterIuiv");
	set_proc_address(&impl_GetSamplerParameteriv,       "glGetSamplerParameteriv");
	set_proc_address(&impl_GetSamplerParameterIiv,      "glGetSamplerParameterIiv");
	set_proc_address(&impl_GetSamplerParameterfv,       "glGetSamplerParameterfv");
	set_proc_address(&impl_GetSamplerParameterIuiv,     "glGetSamplerParameterIuiv");
	set_proc_address(&impl_QueryCounter,                "glQueryCounter");
	set_proc_address(&impl_GetQueryObjecti64v,          "glGetQueryObjecti64v");
	set_proc_address(&impl_GetQueryObjectui64v,         "glGetQueryObjectui64v");
	set_proc_address(&impl_VertexAttribDivisor,         "glVertexAttribDivisor");
	set_proc_address(&impl_VertexAttribP1ui,            "glVertexAttribP1ui");
	set_proc_address(&impl_VertexAttribP1uiv,           "glVertexAttribP1uiv");
	set_proc_address(&impl_VertexAttribP2ui,            "glVertexAttribP2ui");
	set_proc_address(&impl_VertexAttribP2uiv,           "glVertexAttribP2uiv");
	set_proc_address(&impl_VertexAttribP3ui,            "glVertexAttribP3ui");
	set_proc_address(&impl_VertexAttribP3uiv,           "glVertexAttribP3uiv");
	set_proc_address(&impl_VertexAttribP4ui,            "glVertexAttribP4ui");
	set_proc_address(&impl_VertexAttribP4uiv,           "glVertexAttribP4uiv");
	set_proc_address(&impl_VertexP2ui,                  "glVertexP2ui");
	set_proc_address(&impl_VertexP2uiv,                 "glVertexP2uiv");
	set_proc_address(&impl_VertexP3ui,                  "glVertexP3ui");
	set_proc_address(&impl_VertexP3uiv,                 "glVertexP3uiv");
	set_proc_address(&impl_VertexP4ui,                  "glVertexP4ui");
	set_proc_address(&impl_VertexP4uiv,                 "glVertexP4uiv");
	set_proc_address(&impl_TexCoordP1ui,                "glTexCoordP1ui");
	set_proc_address(&impl_TexCoordP1uiv,               "glTexCoordP1uiv");
	set_proc_address(&impl_TexCoordP2ui,                "glTexCoordP2ui");
	set_proc_address(&impl_TexCoordP2uiv,               "glTexCoordP2uiv");
	set_proc_address(&impl_TexCoordP3ui,                "glTexCoordP3ui");
	set_proc_address(&impl_TexCoordP3uiv,               "glTexCoordP3uiv");
	set_proc_address(&impl_TexCoordP4ui,                "glTexCoordP4ui");
	set_proc_address(&impl_TexCoordP4uiv,               "glTexCoordP4uiv");
	set_proc_address(&impl_MultiTexCoordP1ui,           "glMultiTexCoordP1ui");
	set_proc_address(&impl_MultiTexCoordP1uiv,          "glMultiTexCoordP1uiv");
	set_proc_address(&impl_MultiTexCoordP2ui,           "glMultiTexCoordP2ui");
	set_proc_address(&impl_MultiTexCoordP2uiv,          "glMultiTexCoordP2uiv");
	set_proc_address(&impl_MultiTexCoordP3ui,           "glMultiTexCoordP3ui");
	set_proc_address(&impl_MultiTexCoordP3uiv,          "glMultiTexCoordP3uiv");
	set_proc_address(&impl_MultiTexCoordP4ui,           "glMultiTexCoordP4ui");
	set_proc_address(&impl_MultiTexCoordP4uiv,          "glMultiTexCoordP4uiv");
	set_proc_address(&impl_NormalP3ui,                  "glNormalP3ui");
	set_proc_address(&impl_NormalP3uiv,                 "glNormalP3uiv");
	set_proc_address(&impl_ColorP3ui,                   "glColorP3ui");
	set_proc_address(&impl_ColorP3uiv,                  "glColorP3uiv");
	set_proc_address(&impl_ColorP4ui,                   "glColorP4ui");
	set_proc_address(&impl_ColorP4uiv,                  "glColorP4uiv");
	set_proc_address(&impl_SecondaryColorP3ui,          "glSecondaryColorP3ui");
	set_proc_address(&impl_SecondaryColorP3uiv,         "glSecondaryColorP3uiv");
}


// VERSION_4_0
impl_MinSampleShading:               proc "c" (value: f32);
impl_BlendEquationi:                 proc "c" (buf: u32, mode: u32);
impl_BlendEquationSeparatei:         proc "c" (buf: u32, modeRGB: u32, modeAlpha: u32);
impl_BlendFunci:                     proc "c" (buf: u32, src: u32, dst: u32);
impl_BlendFuncSeparatei:             proc "c" (buf: u32, srcRGB: u32, dstRGB: u32, srcAlpha: u32, dstAlpha: u32);
impl_DrawArraysIndirect:             proc "c" (mode: u32, indirect: rawptr);
impl_DrawElementsIndirect:           proc "c" (mode: u32, type: u32, indirect: rawptr);
impl_Uniform1d:                      proc "c" (location: i32, x: f64);
impl_Uniform2d:                      proc "c" (location: i32, x: f64, y: f64);
impl_Uniform3d:                      proc "c" (location: i32, x: f64, y: f64, z: f64);
impl_Uniform4d:                      proc "c" (location: i32, x: f64, y: f64, z: f64, w: f64);
impl_Uniform1dv:                     proc "c" (location: i32, count: i32, value: [^]f64);
impl_Uniform2dv:                     proc "c" (location: i32, count: i32, value: [^]f64);
impl_Uniform3dv:                     proc "c" (location: i32, count: i32, value: [^]f64);
impl_Uniform4dv:                     proc "c" (location: i32, count: i32, value: [^]f64);
impl_UniformMatrix2dv:               proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64);
impl_UniformMatrix3dv:               proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64);
impl_UniformMatrix4dv:               proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64);
impl_UniformMatrix2x3dv:             proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64);
impl_UniformMatrix2x4dv:             proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64);
impl_UniformMatrix3x2dv:             proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64);
impl_UniformMatrix3x4dv:             proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64);
impl_UniformMatrix4x2dv:             proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64);
impl_UniformMatrix4x3dv:             proc "c" (location: i32, count: i32, transpose: bool, value: [^]f64);
impl_GetUniformdv:                   proc "c" (program: u32, location: i32, params: [^]f64);
impl_GetSubroutineUniformLocation:   proc "c" (program: u32, shadertype: u32, name: cstring) -> i32;
impl_GetSubroutineIndex:             proc "c" (program: u32, shadertype: u32, name: cstring) -> u32;
impl_GetActiveSubroutineUniformiv:   proc "c" (program: u32, shadertype: u32, index: u32, pname: u32, values: ^i32);
impl_GetActiveSubroutineUniformName: proc "c" (program: u32, shadertype: u32, index: u32, bufsize: i32, length: ^i32, name: [^]u8);
impl_GetActiveSubroutineName:        proc "c" (program: u32, shadertype: u32, index: u32, bufsize: i32, length: ^i32, name: [^]u8);
impl_UniformSubroutinesuiv:          proc "c" (shadertype: u32, count: i32, indices: ^u32);
impl_GetUniformSubroutineuiv:        proc "c" (shadertype: u32, location: i32, params: [^]u32);
impl_GetProgramStageiv:              proc "c" (program: u32, shadertype: u32, pname: u32, values: ^i32);
impl_PatchParameteri:                proc "c" (pname: u32, value: i32);
impl_PatchParameterfv:               proc "c" (pname: u32, values: ^f32);
impl_BindTransformFeedback:          proc "c" (target: u32, id: u32);
impl_DeleteTransformFeedbacks:       proc "c" (n: i32, ids: [^]u32);
impl_GenTransformFeedbacks:          proc "c" (n: i32, ids: [^]u32);
impl_IsTransformFeedback:            proc "c" (id: u32) -> bool;
impl_PauseTransformFeedback:         proc "c" ();
impl_ResumeTransformFeedback:        proc "c" ();
impl_DrawTransformFeedback:          proc "c" (mode: u32, id: u32);
impl_DrawTransformFeedbackStream:    proc "c" (mode: u32, id: u32, stream: u32);
impl_BeginQueryIndexed:              proc "c" (target: u32, index: u32, id: u32);
impl_EndQueryIndexed:                proc "c" (target: u32, index: u32);
impl_GetQueryIndexediv:              proc "c" (target: u32, index: u32, pname: u32, params: [^]i32);

load_4_0 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_MinSampleShading,               "glMinSampleShading");
	set_proc_address(&impl_BlendEquationi,                 "glBlendEquationi");
	set_proc_address(&impl_BlendEquationSeparatei,         "glBlendEquationSeparatei");
	set_proc_address(&impl_BlendFunci,                     "glBlendFunci");
	set_proc_address(&impl_BlendFuncSeparatei,             "glBlendFuncSeparatei");
	set_proc_address(&impl_DrawArraysIndirect,             "glDrawArraysIndirect");
	set_proc_address(&impl_DrawElementsIndirect,           "glDrawElementsIndirect");
	set_proc_address(&impl_Uniform1d,                      "glUniform1d");
	set_proc_address(&impl_Uniform2d,                      "glUniform2d");
	set_proc_address(&impl_Uniform3d,                      "glUniform3d");
	set_proc_address(&impl_Uniform4d,                      "glUniform4d");
	set_proc_address(&impl_Uniform1dv,                     "glUniform1dv");
	set_proc_address(&impl_Uniform2dv,                     "glUniform2dv");
	set_proc_address(&impl_Uniform3dv,                     "glUniform3dv");
	set_proc_address(&impl_Uniform4dv,                     "glUniform4dv");
	set_proc_address(&impl_UniformMatrix2dv,               "glUniformMatrix2dv");
	set_proc_address(&impl_UniformMatrix3dv,               "glUniformMatrix3dv");
	set_proc_address(&impl_UniformMatrix4dv,               "glUniformMatrix4dv");
	set_proc_address(&impl_UniformMatrix2x3dv,             "glUniformMatrix2x3dv");
	set_proc_address(&impl_UniformMatrix2x4dv,             "glUniformMatrix2x4dv");
	set_proc_address(&impl_UniformMatrix3x2dv,             "glUniformMatrix3x2dv");
	set_proc_address(&impl_UniformMatrix3x4dv,             "glUniformMatrix3x4dv");
	set_proc_address(&impl_UniformMatrix4x2dv,             "glUniformMatrix4x2dv");
	set_proc_address(&impl_UniformMatrix4x3dv,             "glUniformMatrix4x3dv");
	set_proc_address(&impl_GetUniformdv,                   "glGetUniformdv");
	set_proc_address(&impl_GetSubroutineUniformLocation,   "glGetSubroutineUniformLocation");
	set_proc_address(&impl_GetSubroutineIndex,             "glGetSubroutineIndex");
	set_proc_address(&impl_GetActiveSubroutineUniformiv,   "glGetActiveSubroutineUniformiv");
	set_proc_address(&impl_GetActiveSubroutineUniformName, "glGetActiveSubroutineUniformName");
	set_proc_address(&impl_GetActiveSubroutineName,        "glGetActiveSubroutineName");
	set_proc_address(&impl_UniformSubroutinesuiv,          "glUniformSubroutinesuiv");
	set_proc_address(&impl_GetUniformSubroutineuiv,        "glGetUniformSubroutineuiv");
	set_proc_address(&impl_GetProgramStageiv,              "glGetProgramStageiv");
	set_proc_address(&impl_PatchParameteri,                "glPatchParameteri");
	set_proc_address(&impl_PatchParameterfv,               "glPatchParameterfv");
	set_proc_address(&impl_BindTransformFeedback,          "glBindTransformFeedback");
	set_proc_address(&impl_DeleteTransformFeedbacks,       "glDeleteTransformFeedbacks");
	set_proc_address(&impl_GenTransformFeedbacks,          "glGenTransformFeedbacks");
	set_proc_address(&impl_IsTransformFeedback,            "glIsTransformFeedback");
	set_proc_address(&impl_PauseTransformFeedback,         "glPauseTransformFeedback");
	set_proc_address(&impl_ResumeTransformFeedback,        "glResumeTransformFeedback");
	set_proc_address(&impl_DrawTransformFeedback,          "glDrawTransformFeedback");
	set_proc_address(&impl_DrawTransformFeedbackStream,    "glDrawTransformFeedbackStream");
	set_proc_address(&impl_BeginQueryIndexed,              "glBeginQueryIndexed");
	set_proc_address(&impl_EndQueryIndexed,                "glEndQueryIndexed");
	set_proc_address(&impl_GetQueryIndexediv,              "glGetQueryIndexediv");
}


// VERSION_4_1
impl_ReleaseShaderCompiler:     proc "c" ();
impl_ShaderBinary:              proc "c" (count: i32, shaders: ^u32, binaryformat: u32, binary: rawptr, length: i32);
impl_GetShaderPrecisionFormat:  proc "c" (shadertype: u32, precisiontype: u32, range: ^i32, precision: ^i32);
impl_DepthRangef:               proc "c" (n: f32, f: f32);
impl_ClearDepthf:               proc "c" (d: f32);
impl_GetProgramBinary:          proc "c" (program: u32, bufSize: i32, length: ^i32, binaryFormat: ^u32, binary: rawptr);
impl_ProgramBinary:             proc "c" (program: u32, binaryFormat: u32, binary: rawptr, length: i32);
impl_ProgramParameteri:         proc "c" (program: u32, pname: u32, value: i32);
impl_UseProgramStages:          proc "c" (pipeline: u32, stages: u32, program: u32);
impl_ActiveShaderProgram:       proc "c" (pipeline: u32, program: u32);
impl_CreateShaderProgramv:      proc "c" (type: u32, count: i32, strings: [^]cstring) -> u32;
impl_BindProgramPipeline:       proc "c" (pipeline: u32);
impl_DeleteProgramPipelines:    proc "c" (n: i32, pipelines: [^]u32);
impl_GenProgramPipelines:       proc "c" (n: i32, pipelines: [^]u32);
impl_IsProgramPipeline:         proc "c" (pipeline: u32) -> bool;
impl_GetProgramPipelineiv:      proc "c" (pipeline: u32, pname: u32, params: [^]i32);
impl_ProgramUniform1i:          proc "c" (program: u32, location: i32, v0: i32);
impl_ProgramUniform1iv:         proc "c" (program: u32, location: i32, count: i32, value: [^]i32);
impl_ProgramUniform1f:          proc "c" (program: u32, location: i32, v0: f32);
impl_ProgramUniform1fv:         proc "c" (program: u32, location: i32, count: i32, value: [^]f32);
impl_ProgramUniform1d:          proc "c" (program: u32, location: i32, v0: f64);
impl_ProgramUniform1dv:         proc "c" (program: u32, location: i32, count: i32, value: [^]f64);
impl_ProgramUniform1ui:         proc "c" (program: u32, location: i32, v0: u32);
impl_ProgramUniform1uiv:        proc "c" (program: u32, location: i32, count: i32, value: [^]u32);
impl_ProgramUniform2i:          proc "c" (program: u32, location: i32, v0: i32, v1: i32);
impl_ProgramUniform2iv:         proc "c" (program: u32, location: i32, count: i32, value: [^]i32);
impl_ProgramUniform2f:          proc "c" (program: u32, location: i32, v0: f32, v1: f32);
impl_ProgramUniform2fv:         proc "c" (program: u32, location: i32, count: i32, value: [^]f32);
impl_ProgramUniform2d:          proc "c" (program: u32, location: i32, v0: f64, v1: f64);
impl_ProgramUniform2dv:         proc "c" (program: u32, location: i32, count: i32, value: [^]f64);
impl_ProgramUniform2ui:         proc "c" (program: u32, location: i32, v0: u32, v1: u32);
impl_ProgramUniform2uiv:        proc "c" (program: u32, location: i32, count: i32, value: [^]u32);
impl_ProgramUniform3i:          proc "c" (program: u32, location: i32, v0: i32, v1: i32, v2: i32);
impl_ProgramUniform3iv:         proc "c" (program: u32, location: i32, count: i32, value: [^]i32);
impl_ProgramUniform3f:          proc "c" (program: u32, location: i32, v0: f32, v1: f32, v2: f32);
impl_ProgramUniform3fv:         proc "c" (program: u32, location: i32, count: i32, value: [^]f32);
impl_ProgramUniform3d:          proc "c" (program: u32, location: i32, v0: f64, v1: f64, v2: f64);
impl_ProgramUniform3dv:         proc "c" (program: u32, location: i32, count: i32, value: [^]f64);
impl_ProgramUniform3ui:         proc "c" (program: u32, location: i32, v0: u32, v1: u32, v2: u32);
impl_ProgramUniform3uiv:        proc "c" (program: u32, location: i32, count: i32, value: [^]u32);
impl_ProgramUniform4i:          proc "c" (program: u32, location: i32, v0: i32, v1: i32, v2: i32, v3: i32);
impl_ProgramUniform4iv:         proc "c" (program: u32, location: i32, count: i32, value: [^]i32);
impl_ProgramUniform4f:          proc "c" (program: u32, location: i32, v0: f32, v1: f32, v2: f32, v3: f32);
impl_ProgramUniform4fv:         proc "c" (program: u32, location: i32, count: i32, value: [^]f32);
impl_ProgramUniform4d:          proc "c" (program: u32, location: i32, v0: f64, v1: f64, v2: f64, v3: f64);
impl_ProgramUniform4dv:         proc "c" (program: u32, location: i32, count: i32, value: [^]f64);
impl_ProgramUniform4ui:         proc "c" (program: u32, location: i32, v0: u32, v1: u32, v2: u32, v3: u32);
impl_ProgramUniform4uiv:        proc "c" (program: u32, location: i32, count: i32, value: [^]u32);
impl_ProgramUniformMatrix2fv:   proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32);
impl_ProgramUniformMatrix3fv:   proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32);
impl_ProgramUniformMatrix4fv:   proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32);
impl_ProgramUniformMatrix2dv:   proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64);
impl_ProgramUniformMatrix3dv:   proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64);
impl_ProgramUniformMatrix4dv:   proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64);
impl_ProgramUniformMatrix2x3fv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32);
impl_ProgramUniformMatrix3x2fv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32);
impl_ProgramUniformMatrix2x4fv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32);
impl_ProgramUniformMatrix4x2fv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32);
impl_ProgramUniformMatrix3x4fv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32);
impl_ProgramUniformMatrix4x3fv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f32);
impl_ProgramUniformMatrix2x3dv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64);
impl_ProgramUniformMatrix3x2dv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64);
impl_ProgramUniformMatrix2x4dv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64);
impl_ProgramUniformMatrix4x2dv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64);
impl_ProgramUniformMatrix3x4dv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64);
impl_ProgramUniformMatrix4x3dv: proc "c" (program: u32, location: i32, count: i32, transpose: bool, value: [^]f64);
impl_ValidateProgramPipeline:   proc "c" (pipeline: u32);
impl_GetProgramPipelineInfoLog: proc "c" (pipeline: u32, bufSize: i32, length: ^i32, infoLog: ^u8);
impl_VertexAttribL1d:           proc "c" (index: u32, x: f64);
impl_VertexAttribL2d:           proc "c" (index: u32, x: f64, y: f64);
impl_VertexAttribL3d:           proc "c" (index: u32, x: f64, y: f64, z: f64);
impl_VertexAttribL4d:           proc "c" (index: u32, x: f64, y: f64, z: f64, w: f64);
impl_VertexAttribL1dv:          proc "c" (index: u32, v: ^f64);
impl_VertexAttribL2dv:          proc "c" (index: u32, v: ^f64);
impl_VertexAttribL3dv:          proc "c" (index: u32, v: ^f64);
impl_VertexAttribL4dv:          proc "c" (index: u32, v: ^f64);
impl_VertexAttribLPointer:      proc "c" (index: u32, size: i32, type: u32, stride: i32, pointer: rawptr);
impl_GetVertexAttribLdv:        proc "c" (index: u32, pname: u32, params: [^]f64);
impl_ViewportArrayv:            proc "c" (first: u32, count: i32, v: ^f32);
impl_ViewportIndexedf:          proc "c" (index: u32, x: f32, y: f32, w: f32, h: f32);
impl_ViewportIndexedfv:         proc "c" (index: u32, v: ^f32);
impl_ScissorArrayv:             proc "c" (first: u32, count: i32, v: ^i32);
impl_ScissorIndexed:            proc "c" (index: u32, left: i32, bottom: i32, width: i32, height: i32);
impl_ScissorIndexedv:           proc "c" (index: u32, v: ^i32);
impl_DepthRangeArrayv:          proc "c" (first: u32, count: i32, v: ^f64);
impl_DepthRangeIndexed:         proc "c" (index: u32, n: f64, f: f64);
impl_GetFloati_v:               proc "c" (target: u32, index: u32, data: ^f32);
impl_GetDoublei_v:              proc "c" (target: u32, index: u32, data: ^f64);

load_4_1 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_ReleaseShaderCompiler,     "glReleaseShaderCompiler");
	set_proc_address(&impl_ShaderBinary,              "glShaderBinary");
	set_proc_address(&impl_GetShaderPrecisionFormat,  "glGetShaderPrecisionFormat");
	set_proc_address(&impl_DepthRangef,               "glDepthRangef");
	set_proc_address(&impl_ClearDepthf,               "glClearDepthf");
	set_proc_address(&impl_GetProgramBinary,          "glGetProgramBinary");
	set_proc_address(&impl_ProgramBinary,             "glProgramBinary");
	set_proc_address(&impl_ProgramParameteri,         "glProgramParameteri");
	set_proc_address(&impl_UseProgramStages,          "glUseProgramStages");
	set_proc_address(&impl_ActiveShaderProgram,       "glActiveShaderProgram");
	set_proc_address(&impl_CreateShaderProgramv,      "glCreateShaderProgramv");
	set_proc_address(&impl_BindProgramPipeline,       "glBindProgramPipeline");
	set_proc_address(&impl_DeleteProgramPipelines,    "glDeleteProgramPipelines");
	set_proc_address(&impl_GenProgramPipelines,       "glGenProgramPipelines");
	set_proc_address(&impl_IsProgramPipeline,         "glIsProgramPipeline");
	set_proc_address(&impl_GetProgramPipelineiv,      "glGetProgramPipelineiv");
	set_proc_address(&impl_ProgramUniform1i,          "glProgramUniform1i");
	set_proc_address(&impl_ProgramUniform1iv,         "glProgramUniform1iv");
	set_proc_address(&impl_ProgramUniform1f,          "glProgramUniform1f");
	set_proc_address(&impl_ProgramUniform1fv,         "glProgramUniform1fv");
	set_proc_address(&impl_ProgramUniform1d,          "glProgramUniform1d");
	set_proc_address(&impl_ProgramUniform1dv,         "glProgramUniform1dv");
	set_proc_address(&impl_ProgramUniform1ui,         "glProgramUniform1ui");
	set_proc_address(&impl_ProgramUniform1uiv,        "glProgramUniform1uiv");
	set_proc_address(&impl_ProgramUniform2i,          "glProgramUniform2i");
	set_proc_address(&impl_ProgramUniform2iv,         "glProgramUniform2iv");
	set_proc_address(&impl_ProgramUniform2f,          "glProgramUniform2f");
	set_proc_address(&impl_ProgramUniform2fv,         "glProgramUniform2fv");
	set_proc_address(&impl_ProgramUniform2d,          "glProgramUniform2d");
	set_proc_address(&impl_ProgramUniform2dv,         "glProgramUniform2dv");
	set_proc_address(&impl_ProgramUniform2ui,         "glProgramUniform2ui");
	set_proc_address(&impl_ProgramUniform2uiv,        "glProgramUniform2uiv");
	set_proc_address(&impl_ProgramUniform3i,          "glProgramUniform3i");
	set_proc_address(&impl_ProgramUniform3iv,         "glProgramUniform3iv");
	set_proc_address(&impl_ProgramUniform3f,          "glProgramUniform3f");
	set_proc_address(&impl_ProgramUniform3fv,         "glProgramUniform3fv");
	set_proc_address(&impl_ProgramUniform3d,          "glProgramUniform3d");
	set_proc_address(&impl_ProgramUniform3dv,         "glProgramUniform3dv");
	set_proc_address(&impl_ProgramUniform3ui,         "glProgramUniform3ui");
	set_proc_address(&impl_ProgramUniform3uiv,        "glProgramUniform3uiv");
	set_proc_address(&impl_ProgramUniform4i,          "glProgramUniform4i");
	set_proc_address(&impl_ProgramUniform4iv,         "glProgramUniform4iv");
	set_proc_address(&impl_ProgramUniform4f,          "glProgramUniform4f");
	set_proc_address(&impl_ProgramUniform4fv,         "glProgramUniform4fv");
	set_proc_address(&impl_ProgramUniform4d,          "glProgramUniform4d");
	set_proc_address(&impl_ProgramUniform4dv,         "glProgramUniform4dv");
	set_proc_address(&impl_ProgramUniform4ui,         "glProgramUniform4ui");
	set_proc_address(&impl_ProgramUniform4uiv,        "glProgramUniform4uiv");
	set_proc_address(&impl_ProgramUniformMatrix2fv,   "glProgramUniformMatrix2fv");
	set_proc_address(&impl_ProgramUniformMatrix3fv,   "glProgramUniformMatrix3fv");
	set_proc_address(&impl_ProgramUniformMatrix4fv,   "glProgramUniformMatrix4fv");
	set_proc_address(&impl_ProgramUniformMatrix2dv,   "glProgramUniformMatrix2dv");
	set_proc_address(&impl_ProgramUniformMatrix3dv,   "glProgramUniformMatrix3dv");
	set_proc_address(&impl_ProgramUniformMatrix4dv,   "glProgramUniformMatrix4dv");
	set_proc_address(&impl_ProgramUniformMatrix2x3fv, "glProgramUniformMatrix2x3fv");
	set_proc_address(&impl_ProgramUniformMatrix3x2fv, "glProgramUniformMatrix3x2fv");
	set_proc_address(&impl_ProgramUniformMatrix2x4fv, "glProgramUniformMatrix2x4fv");
	set_proc_address(&impl_ProgramUniformMatrix4x2fv, "glProgramUniformMatrix4x2fv");
	set_proc_address(&impl_ProgramUniformMatrix3x4fv, "glProgramUniformMatrix3x4fv");
	set_proc_address(&impl_ProgramUniformMatrix4x3fv, "glProgramUniformMatrix4x3fv");
	set_proc_address(&impl_ProgramUniformMatrix2x3dv, "glProgramUniformMatrix2x3dv");
	set_proc_address(&impl_ProgramUniformMatrix3x2dv, "glProgramUniformMatrix3x2dv");
	set_proc_address(&impl_ProgramUniformMatrix2x4dv, "glProgramUniformMatrix2x4dv");
	set_proc_address(&impl_ProgramUniformMatrix4x2dv, "glProgramUniformMatrix4x2dv");
	set_proc_address(&impl_ProgramUniformMatrix3x4dv, "glProgramUniformMatrix3x4dv");
	set_proc_address(&impl_ProgramUniformMatrix4x3dv, "glProgramUniformMatrix4x3dv");
	set_proc_address(&impl_ValidateProgramPipeline,   "glValidateProgramPipeline");
	set_proc_address(&impl_GetProgramPipelineInfoLog, "glGetProgramPipelineInfoLog");
	set_proc_address(&impl_VertexAttribL1d,           "glVertexAttribL1d");
	set_proc_address(&impl_VertexAttribL2d,           "glVertexAttribL2d");
	set_proc_address(&impl_VertexAttribL3d,           "glVertexAttribL3d");
	set_proc_address(&impl_VertexAttribL4d,           "glVertexAttribL4d");
	set_proc_address(&impl_VertexAttribL1dv,          "glVertexAttribL1dv");
	set_proc_address(&impl_VertexAttribL2dv,          "glVertexAttribL2dv");
	set_proc_address(&impl_VertexAttribL3dv,          "glVertexAttribL3dv");
	set_proc_address(&impl_VertexAttribL4dv,          "glVertexAttribL4dv");
	set_proc_address(&impl_VertexAttribLPointer,      "glVertexAttribLPointer");
	set_proc_address(&impl_GetVertexAttribLdv,        "glGetVertexAttribLdv");
	set_proc_address(&impl_ViewportArrayv,            "glViewportArrayv");
	set_proc_address(&impl_ViewportIndexedf,          "glViewportIndexedf");
	set_proc_address(&impl_ViewportIndexedfv,         "glViewportIndexedfv");
	set_proc_address(&impl_ScissorArrayv,             "glScissorArrayv");
	set_proc_address(&impl_ScissorIndexed,            "glScissorIndexed");
	set_proc_address(&impl_ScissorIndexedv,           "glScissorIndexedv");
	set_proc_address(&impl_DepthRangeArrayv,          "glDepthRangeArrayv");
	set_proc_address(&impl_DepthRangeIndexed,         "glDepthRangeIndexed");
	set_proc_address(&impl_GetFloati_v,               "glGetFloati_v");
	set_proc_address(&impl_GetDoublei_v,              "glGetDoublei_v");
}


// VERSION_4_2
impl_DrawArraysInstancedBaseInstance:             proc "c" (mode: u32, first: i32, count: i32, instancecount: i32, baseinstance: u32);
impl_DrawElementsInstancedBaseInstance:           proc "c" (mode: u32, count: i32, type: u32, indices: rawptr, instancecount: i32, baseinstance: u32);
impl_DrawElementsInstancedBaseVertexBaseInstance: proc "c" (mode: u32, count: i32, type: u32, indices: rawptr, instancecount: i32, basevertex: i32, baseinstance: u32);
impl_GetInternalformativ:                         proc "c" (target: u32, internalformat: u32, pname: u32, bufSize: i32, params: [^]i32);
impl_GetActiveAtomicCounterBufferiv:              proc "c" (program: u32, bufferIndex: u32, pname: u32, params: [^]i32);
impl_BindImageTexture:                            proc "c" (unit: u32, texture: u32, level: i32, layered: u8, layer: i32, access: u32, format: u32);
impl_MemoryBarrier:                               proc "c" (barriers: u32);
impl_TexStorage1D:                                proc "c" (target: u32, levels: i32, internalformat: u32, width: i32);
impl_TexStorage2D:                                proc "c" (target: u32, levels: i32, internalformat: u32, width: i32, height: i32);
impl_TexStorage3D:                                proc "c" (target: u32, levels: i32, internalformat: u32, width: i32, height: i32, depth: i32);
impl_DrawTransformFeedbackInstanced:              proc "c" (mode: u32, id: u32, instancecount: i32);
impl_DrawTransformFeedbackStreamInstanced:        proc "c" (mode: u32, id: u32, stream: u32, instancecount: i32);

load_4_2 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_DrawArraysInstancedBaseInstance,             "glDrawArraysInstancedBaseInstance");
	set_proc_address(&impl_DrawElementsInstancedBaseInstance,           "glDrawElementsInstancedBaseInstance");
	set_proc_address(&impl_DrawElementsInstancedBaseVertexBaseInstance, "glDrawElementsInstancedBaseVertexBaseInstance");
	set_proc_address(&impl_GetInternalformativ,                         "glGetInternalformativ");
	set_proc_address(&impl_GetActiveAtomicCounterBufferiv,              "glGetActiveAtomicCounterBufferiv");
	set_proc_address(&impl_BindImageTexture,                            "glBindImageTexture");
	set_proc_address(&impl_MemoryBarrier,                               "glMemoryBarrier");
	set_proc_address(&impl_TexStorage1D,                                "glTexStorage1D");
	set_proc_address(&impl_TexStorage2D,                                "glTexStorage2D");
	set_proc_address(&impl_TexStorage3D,                                "glTexStorage3D");
	set_proc_address(&impl_DrawTransformFeedbackInstanced,              "glDrawTransformFeedbackInstanced");
	set_proc_address(&impl_DrawTransformFeedbackStreamInstanced,        "glDrawTransformFeedbackStreamInstanced");
}

// VERSION_4_3
impl_ClearBufferData:                 proc "c" (target: u32, internalformat: u32, format: u32, type: u32, data: rawptr);
impl_ClearBufferSubData:              proc "c" (target: u32, internalformat: u32, offset: int, size: int, format: u32, type: u32, data: rawptr);
impl_DispatchCompute:                 proc "c" (num_groups_x: u32, num_groups_y: u32, num_groups_z: u32);
impl_DispatchComputeIndirect:         proc "c" (indirect: int);
impl_CopyImageSubData:                proc "c" (srcName: u32, srcTarget: u32, srcLevel: i32, srcX: i32, srcY: i32, srcZ: i32, dstName: u32, dstTarget: u32, dstLevel: i32, dstX: i32, dstY: i32, dstZ: i32, srcWidth: i32, srcHeight: i32, srcDepth: i32);
impl_FramebufferParameteri:           proc "c" (target: u32, pname: u32, param: i32);
impl_GetFramebufferParameteriv:       proc "c" (target: u32, pname: u32, params: [^]i32);
impl_GetInternalformati64v:           proc "c" (target: u32, internalformat: u32, pname: u32, bufSize: i32, params: [^]i64);
impl_InvalidateTexSubImage:           proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32);
impl_InvalidateTexImage:              proc "c" (texture: u32, level: i32);
impl_InvalidateBufferSubData:         proc "c" (buffer: u32, offset: int, length: int);
impl_InvalidateBufferData:            proc "c" (buffer: u32);
impl_InvalidateFramebuffer:           proc "c" (target: u32, numAttachments: i32, attachments: ^u32);
impl_InvalidateSubFramebuffer:        proc "c" (target: u32, numAttachments: i32, attachments: ^u32, x: i32, y: i32, width: i32, height: i32);
impl_MultiDrawArraysIndirect:         proc "c" (mode: u32, indirect: rawptr, drawcount: i32, stride: i32);
impl_MultiDrawElementsIndirect:       proc "c" (mode: u32, type: u32, indirect: rawptr, drawcount: i32, stride: i32);
impl_GetProgramInterfaceiv:           proc "c" (program: u32, programInterface: u32, pname: u32, params: [^]i32);
impl_GetProgramResourceIndex:         proc "c" (program: u32, programInterface: u32, name: cstring) -> u32;
impl_GetProgramResourceName:          proc "c" (program: u32, programInterface: u32, index: u32, bufSize: i32, length: ^i32, name: [^]u8);
impl_GetProgramResourceiv:            proc "c" (program: u32, programInterface: u32, index: u32, propCount: i32, props: ^u32, bufSize: i32, length: ^i32, params: [^]i32);
impl_GetProgramResourceLocation:      proc "c" (program: u32, programInterface: u32, name: cstring) -> i32;
impl_GetProgramResourceLocationIndex: proc "c" (program: u32, programInterface: u32, name: cstring) -> i32;
impl_ShaderStorageBlockBinding:       proc "c" (program: u32, storageBlockIndex: u32, storageBlockBinding: u32);
impl_TexBufferRange:                  proc "c" (target: u32, internalformat: u32, buffer: u32, offset: int, size: int);
impl_TexStorage2DMultisample:         proc "c" (target: u32, samples: i32, internalformat: u32, width: i32, height: i32, fixedsamplelocations: u8);
impl_TexStorage3DMultisample:         proc "c" (target: u32, samples: i32, internalformat: u32, width: i32, height: i32, depth: i32, fixedsamplelocations: u8);
impl_TextureView:                     proc "c" (texture: u32, target: u32, origtexture: u32, internalformat: u32, minlevel: u32, numlevels: u32, minlayer: u32, numlayers: u32);
impl_BindVertexBuffer:                proc "c" (bindingindex: u32, buffer: u32, offset: int, stride: i32);
impl_VertexAttribFormat:              proc "c" (attribindex: u32, size: i32, type: u32, normalized: bool, relativeoffset: u32);
impl_VertexAttribIFormat:             proc "c" (attribindex: u32, size: i32, type: u32, relativeoffset: u32);
impl_VertexAttribLFormat:             proc "c" (attribindex: u32, size: i32, type: u32, relativeoffset: u32);
impl_VertexAttribBinding:             proc "c" (attribindex: u32, bindingindex: u32);
impl_VertexBindingDivisor:            proc "c" (bindingindex: u32, divisor: u32);
impl_DebugMessageControl:             proc "c" (source: u32, type: u32, severity: u32, count: i32, ids: ^u32, enabled: u8);
impl_DebugMessageInsert:              proc "c" (source: u32, type: u32, id: u32, severity: u32, length: i32, buf: ^u8);
impl_DebugMessageCallback:            proc "c" (callback: debug_proc_t, userParam: rawptr);
impl_GetDebugMessageLog:              proc "c" (count: u32, bufSize: i32, sources: [^]u32, types: [^]u32, ids: [^]u32, severities: [^]u32, lengths: [^]i32, messageLog: [^]u8) -> u32;
impl_PushDebugGroup:                  proc "c" (source: u32, id: u32, length: i32, message: cstring);
impl_PopDebugGroup:                   proc "c" ();
impl_ObjectLabel:                     proc "c" (identifier: u32, name: u32, length: i32, label: [^]u8);
impl_GetObjectLabel:                  proc "c" (identifier: u32, name: u32, bufSize: i32, length: ^i32, label: [^]u8);
impl_ObjectPtrLabel:                  proc "c" (ptr: rawptr, length: i32, label: [^]u8);
impl_GetObjectPtrLabel:               proc "c" (ptr: rawptr, bufSize: i32, length: ^i32, label: [^]u8);

load_4_3 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_ClearBufferData,                 "glClearBufferData");
	set_proc_address(&impl_ClearBufferSubData,              "glClearBufferSubData");
	set_proc_address(&impl_DispatchCompute,                 "glDispatchCompute");
	set_proc_address(&impl_DispatchComputeIndirect,         "glDispatchComputeIndirect");
	set_proc_address(&impl_CopyImageSubData,                "glCopyImageSubData");
	set_proc_address(&impl_FramebufferParameteri,           "glFramebufferParameteri");
	set_proc_address(&impl_GetFramebufferParameteriv,       "glGetFramebufferParameteriv");
	set_proc_address(&impl_GetInternalformati64v,           "glGetInternalformati64v");
	set_proc_address(&impl_InvalidateTexSubImage,           "glInvalidateTexSubImage");
	set_proc_address(&impl_InvalidateTexImage,              "glInvalidateTexImage");
	set_proc_address(&impl_InvalidateBufferSubData,         "glInvalidateBufferSubData");
	set_proc_address(&impl_InvalidateBufferData,            "glInvalidateBufferData");
	set_proc_address(&impl_InvalidateFramebuffer,           "glInvalidateFramebuffer");
	set_proc_address(&impl_InvalidateSubFramebuffer,        "glInvalidateSubFramebuffer");
	set_proc_address(&impl_MultiDrawArraysIndirect,         "glMultiDrawArraysIndirect");
	set_proc_address(&impl_MultiDrawElementsIndirect,       "glMultiDrawElementsIndirect");
	set_proc_address(&impl_GetProgramInterfaceiv,           "glGetProgramInterfaceiv");
	set_proc_address(&impl_GetProgramResourceIndex,         "glGetProgramResourceIndex");
	set_proc_address(&impl_GetProgramResourceName,          "glGetProgramResourceName");
	set_proc_address(&impl_GetProgramResourceiv,            "glGetProgramResourceiv");
	set_proc_address(&impl_GetProgramResourceLocation,      "glGetProgramResourceLocation");
	set_proc_address(&impl_GetProgramResourceLocationIndex, "glGetProgramResourceLocationIndex");
	set_proc_address(&impl_ShaderStorageBlockBinding,       "glShaderStorageBlockBinding");
	set_proc_address(&impl_TexBufferRange,                  "glTexBufferRange");
	set_proc_address(&impl_TexStorage2DMultisample,         "glTexStorage2DMultisample");
	set_proc_address(&impl_TexStorage3DMultisample,         "glTexStorage3DMultisample");
	set_proc_address(&impl_TextureView,                     "glTextureView");
	set_proc_address(&impl_BindVertexBuffer,                "glBindVertexBuffer");
	set_proc_address(&impl_VertexAttribFormat,              "glVertexAttribFormat");
	set_proc_address(&impl_VertexAttribIFormat,             "glVertexAttribIFormat");
	set_proc_address(&impl_VertexAttribLFormat,             "glVertexAttribLFormat");
	set_proc_address(&impl_VertexAttribBinding,             "glVertexAttribBinding");
	set_proc_address(&impl_VertexBindingDivisor,            "glVertexBindingDivisor");
	set_proc_address(&impl_DebugMessageControl,             "glDebugMessageControl");
	set_proc_address(&impl_DebugMessageInsert,              "glDebugMessageInsert");
	set_proc_address(&impl_DebugMessageCallback,            "glDebugMessageCallback");
	set_proc_address(&impl_GetDebugMessageLog,              "glGetDebugMessageLog");
	set_proc_address(&impl_PushDebugGroup,                  "glPushDebugGroup");
	set_proc_address(&impl_PopDebugGroup,                   "glPopDebugGroup");
	set_proc_address(&impl_ObjectLabel,                     "glObjectLabel");
	set_proc_address(&impl_GetObjectLabel,                  "glGetObjectLabel");
	set_proc_address(&impl_ObjectPtrLabel,                  "glObjectPtrLabel");
	set_proc_address(&impl_GetObjectPtrLabel,               "glGetObjectPtrLabel");
}

// VERSION_4_4
impl_BufferStorage:     proc "c" (target: u32, size: int, data: rawptr, flags: u32);
impl_ClearTexImage:     proc "c" (texture: u32, level: i32, format: u32, type: u32, data: rawptr);
impl_ClearTexSubImage:  proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, type: u32, data: rawptr);
impl_BindBuffersBase:   proc "c" (target: u32, first: u32, count: i32, buffers: [^]u32);
impl_BindBuffersRange:  proc "c" (target: u32, first: u32, count: i32, buffers: [^]u32, offsets: [^]uintptr, sizes: [^]int);
impl_BindTextures:      proc "c" (first: u32, count: i32, textures: [^]u32);
impl_BindSamplers:      proc "c" (first: u32, count: i32, samplers: [^]u32);
impl_BindImageTextures: proc "c" (first: u32, count: i32, textures: [^]u32);
impl_BindVertexBuffers: proc "c" (first: u32, count: i32, buffers: [^]u32, offsets: [^]uintptr, strides: [^]i32);

load_4_4 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_BufferStorage,     "glBufferStorage");
	set_proc_address(&impl_ClearTexImage,     "glClearTexImage");
	set_proc_address(&impl_ClearTexSubImage,  "glClearTexSubImage");
	set_proc_address(&impl_BindBuffersBase,   "glBindBuffersBase");
	set_proc_address(&impl_BindBuffersRange,  "glBindBuffersRange");
	set_proc_address(&impl_BindTextures,      "glBindTextures");
	set_proc_address(&impl_BindSamplers,      "glBindSamplers");
	set_proc_address(&impl_BindImageTextures, "glBindImageTextures");
	set_proc_address(&impl_BindVertexBuffers, "glBindVertexBuffers");
}

// VERSION_4_5
impl_ClipControl:                              proc "c" (origin: u32, depth: u32);
impl_CreateTransformFeedbacks:                 proc "c" (n: i32, ids: [^]u32);
impl_TransformFeedbackBufferBase:              proc "c" (xfb: u32, index: u32, buffer: u32);
impl_TransformFeedbackBufferRange:             proc "c" (xfb: u32, index: u32, buffer: u32, offset: int, size: int);
impl_GetTransformFeedbackiv:                   proc "c" (xfb: u32, pname: u32, param: ^i32);
impl_GetTransformFeedbacki_v:                  proc "c" (xfb: u32, pname: u32, index: u32, param: ^i32);
impl_GetTransformFeedbacki64_v:                proc "c" (xfb: u32, pname: u32, index: u32, param: ^i64);
impl_CreateBuffers:                            proc "c" (n: i32, buffers: [^]u32);
impl_NamedBufferStorage:                       proc "c" (buffer: u32, size: int, data: rawptr, flags: u32);
impl_NamedBufferData:                          proc "c" (buffer: u32, size: int, data: rawptr, usage: u32);
impl_NamedBufferSubData:                       proc "c" (buffer: u32, offset: int, size: int, data: rawptr);
impl_CopyNamedBufferSubData:                   proc "c" (readBuffer: u32, writeBuffer: u32, readOffset: int, writeOffset: int, size: int);
impl_ClearNamedBufferData:                     proc "c" (buffer: u32, internalformat: u32, format: u32, type: u32, data: rawptr);
impl_ClearNamedBufferSubData:                  proc "c" (buffer: u32, internalformat: u32, offset: int, size: int, format: u32, type: u32, data: rawptr);
impl_MapNamedBuffer:                           proc "c" (buffer: u32, access: u32) -> rawptr;
impl_MapNamedBufferRange:                      proc "c" (buffer: u32, offset: int, length: int, access: u32) -> rawptr;
impl_UnmapNamedBuffer:                         proc "c" (buffer: u32) -> bool;
impl_FlushMappedNamedBufferRange:              proc "c" (buffer: u32, offset: int, length: int);
impl_GetNamedBufferParameteriv:                proc "c" (buffer: u32, pname: u32, params: [^]i32);
impl_GetNamedBufferParameteri64v:              proc "c" (buffer: u32, pname: u32, params: [^]i64);
impl_GetNamedBufferPointerv:                   proc "c" (buffer: u32, pname: u32, params: [^]rawptr);
impl_GetNamedBufferSubData:                    proc "c" (buffer: u32, offset: int, size: int, data: rawptr);
impl_CreateFramebuffers:                       proc "c" (n: i32, framebuffers: [^]u32);
impl_NamedFramebufferRenderbuffer:             proc "c" (framebuffer: u32, attachment: u32, renderbuffertarget: u32, renderbuffer: u32);
impl_NamedFramebufferParameteri:               proc "c" (framebuffer: u32, pname: u32, param: i32);
impl_NamedFramebufferTexture:                  proc "c" (framebuffer: u32, attachment: u32, texture: u32, level: i32);
impl_NamedFramebufferTextureLayer:             proc "c" (framebuffer: u32, attachment: u32, texture: u32, level: i32, layer: i32);
impl_NamedFramebufferDrawBuffer:               proc "c" (framebuffer: u32, buf: u32);
impl_NamedFramebufferDrawBuffers:              proc "c" (framebuffer: u32, n: i32, bufs: ^u32);
impl_NamedFramebufferReadBuffer:               proc "c" (framebuffer: u32, src: u32);
impl_InvalidateNamedFramebufferData:           proc "c" (framebuffer: u32, numAttachments: i32, attachments: ^u32);
impl_InvalidateNamedFramebufferSubData:        proc "c" (framebuffer: u32, numAttachments: i32, attachments: ^u32, x: i32, y: i32, width: i32, height: i32);
impl_ClearNamedFramebufferiv:                  proc "c" (framebuffer: u32, buffer: u32, drawbuffer: i32, value: ^i32);
impl_ClearNamedFramebufferuiv:                 proc "c" (framebuffer: u32, buffer: u32, drawbuffer: i32, value: ^u32);
impl_ClearNamedFramebufferfv:                  proc "c" (framebuffer: u32, buffer: u32, drawbuffer: i32, value: ^f32);
impl_ClearNamedFramebufferfi:                  proc "c" (framebuffer: u32, buffer: u32, drawbuffer: i32, depth: f32, stencil: i32);
impl_BlitNamedFramebuffer:                     proc "c" (readFramebuffer: u32, drawFramebuffer: u32, srcX0: i32, srcY0: i32, srcX1: i32, srcY1: i32, dstX0: i32, dstY0: i32, dstX1: i32, dstY1: i32, mask: u32, filter: u32);
impl_CheckNamedFramebufferStatus:              proc "c" (framebuffer: u32, target: u32) -> u32;
impl_GetNamedFramebufferParameteriv:           proc "c" (framebuffer: u32, pname: u32, param: ^i32);
impl_GetNamedFramebufferAttachmentParameteriv: proc "c" (framebuffer: u32, attachment: u32, pname: u32, params: [^]i32);
impl_CreateRenderbuffers:                      proc "c" (n: i32, renderbuffers: [^]u32);
impl_NamedRenderbufferStorage:                 proc "c" (renderbuffer: u32, internalformat: u32, width: i32, height: i32);
impl_NamedRenderbufferStorageMultisample:      proc "c" (renderbuffer: u32, samples: i32, internalformat: u32, width: i32, height: i32);
impl_GetNamedRenderbufferParameteriv:          proc "c" (renderbuffer: u32, pname: u32, params: [^]i32);
impl_CreateTextures:                           proc "c" (target: u32, n: i32, textures: [^]u32);
impl_TextureBuffer:                            proc "c" (texture: u32, internalformat: u32, buffer: u32);
impl_TextureBufferRange:                       proc "c" (texture: u32, internalformat: u32, buffer: u32, offset: int, size: int);
impl_TextureStorage1D:                         proc "c" (texture: u32, levels: i32, internalformat: u32, width: i32);
impl_TextureStorage2D:                         proc "c" (texture: u32, levels: i32, internalformat: u32, width: i32, height: i32);
impl_TextureStorage3D:                         proc "c" (texture: u32, levels: i32, internalformat: u32, width: i32, height: i32, depth: i32);
impl_TextureStorage2DMultisample:              proc "c" (texture: u32, samples: i32, internalformat: u32, width: i32, height: i32, fixedsamplelocations: u8);
impl_TextureStorage3DMultisample:              proc "c" (texture: u32, samples: i32, internalformat: u32, width: i32, height: i32, depth: i32, fixedsamplelocations: u8);
impl_TextureSubImage1D:                        proc "c" (texture: u32, level: i32, xoffset: i32, width: i32, format: u32, type: u32, pixels: rawptr);
impl_TextureSubImage2D:                        proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, type: u32, pixels: rawptr);
impl_TextureSubImage3D:                        proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, type: u32, pixels: rawptr);
impl_CompressedTextureSubImage1D:              proc "c" (texture: u32, level: i32, xoffset: i32, width: i32, format: u32, imageSize: i32, data: rawptr);
impl_CompressedTextureSubImage2D:              proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, width: i32, height: i32, format: u32, imageSize: i32, data: rawptr);
impl_CompressedTextureSubImage3D:              proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, imageSize: i32, data: rawptr);
impl_CopyTextureSubImage1D:                    proc "c" (texture: u32, level: i32, xoffset: i32, x: i32, y: i32, width: i32);
impl_CopyTextureSubImage2D:                    proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, x: i32, y: i32, width: i32, height: i32);
impl_CopyTextureSubImage3D:                    proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, x: i32, y: i32, width: i32, height: i32);
impl_TextureParameterf:                        proc "c" (texture: u32, pname: u32, param: f32);
impl_TextureParameterfv:                       proc "c" (texture: u32, pname: u32, param: ^f32);
impl_TextureParameteri:                        proc "c" (texture: u32, pname: u32, param: i32);
impl_TextureParameterIiv:                      proc "c" (texture: u32, pname: u32, params: [^]i32);
impl_TextureParameterIuiv:                     proc "c" (texture: u32, pname: u32, params: [^]u32);
impl_TextureParameteriv:                       proc "c" (texture: u32, pname: u32, param: ^i32);
impl_GenerateTextureMipmap:                    proc "c" (texture: u32);
impl_BindTextureUnit:                          proc "c" (unit: u32, texture: u32);
impl_GetTextureImage:                          proc "c" (texture: u32, level: i32, format: u32, type: u32, bufSize: i32, pixels: rawptr);
impl_GetCompressedTextureImage:                proc "c" (texture: u32, level: i32, bufSize: i32, pixels: rawptr);
impl_GetTextureLevelParameterfv:               proc "c" (texture: u32, level: i32, pname: u32, params: [^]f32);
impl_GetTextureLevelParameteriv:               proc "c" (texture: u32, level: i32, pname: u32, params: [^]i32);
impl_GetTextureParameterfv:                    proc "c" (texture: u32, pname: u32, params: [^]f32);
impl_GetTextureParameterIiv:                   proc "c" (texture: u32, pname: u32, params: [^]i32);
impl_GetTextureParameterIuiv:                  proc "c" (texture: u32, pname: u32, params: [^]u32);
impl_GetTextureParameteriv:                    proc "c" (texture: u32, pname: u32, params: [^]i32);
impl_CreateVertexArrays:                       proc "c" (n: i32, arrays: [^]u32);
impl_DisableVertexArrayAttrib:                 proc "c" (vaobj: u32, index: u32);
impl_EnableVertexArrayAttrib:                  proc "c" (vaobj: u32, index: u32);
impl_VertexArrayElementBuffer:                 proc "c" (vaobj: u32, buffer: u32);
impl_VertexArrayVertexBuffer:                  proc "c" (vaobj: u32, bindingindex: u32, buffer: u32, offset: int, stride: i32);
impl_VertexArrayVertexBuffers:                 proc "c" (vaobj: u32, first: u32, count: i32, buffers: [^]u32, offsets: [^]uintptr, strides: [^]i32);
impl_VertexArrayAttribBinding:                 proc "c" (vaobj: u32, attribindex: u32, bindingindex: u32);
impl_VertexArrayAttribFormat:                  proc "c" (vaobj: u32, attribindex: u32, size: i32, type: u32, normalized: bool, relativeoffset: u32);
impl_VertexArrayAttribIFormat:                 proc "c" (vaobj: u32, attribindex: u32, size: i32, type: u32, relativeoffset: u32);
impl_VertexArrayAttribLFormat:                 proc "c" (vaobj: u32, attribindex: u32, size: i32, type: u32, relativeoffset: u32);
impl_VertexArrayBindingDivisor:                proc "c" (vaobj: u32, bindingindex: u32, divisor: u32);
impl_GetVertexArrayiv:                         proc "c" (vaobj: u32, pname: u32, param: ^i32);
impl_GetVertexArrayIndexediv:                  proc "c" (vaobj: u32, index: u32, pname: u32, param: ^i32);
impl_GetVertexArrayIndexed64iv:                proc "c" (vaobj: u32, index: u32, pname: u32, param: ^i64);
impl_CreateSamplers:                           proc "c" (n: i32, samplers: [^]u32);
impl_CreateProgramPipelines:                   proc "c" (n: i32, pipelines: [^]u32);
impl_CreateQueries:                            proc "c" (target: u32, n: i32, ids: [^]u32);
impl_GetQueryBufferObjecti64v:                 proc "c" (id: u32, buffer: u32, pname: u32, offset: int);
impl_GetQueryBufferObjectiv:                   proc "c" (id: u32, buffer: u32, pname: u32, offset: int);
impl_GetQueryBufferObjectui64v:                proc "c" (id: u32, buffer: u32, pname: u32, offset: int);
impl_GetQueryBufferObjectuiv:                  proc "c" (id: u32, buffer: u32, pname: u32, offset: int);
impl_MemoryBarrierByRegion:                    proc "c" (barriers: u32);
impl_GetTextureSubImage:                       proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, format: u32, type: u32, bufSize: i32, pixels: rawptr);
impl_GetCompressedTextureSubImage:             proc "c" (texture: u32, level: i32, xoffset: i32, yoffset: i32, zoffset: i32, width: i32, height: i32, depth: i32, bufSize: i32, pixels: rawptr);
impl_GetGraphicsResetStatus:                   proc "c" () -> u32;
impl_GetnCompressedTexImage:                   proc "c" (target: u32, lod: i32, bufSize: i32, pixels: rawptr);
impl_GetnTexImage:                             proc "c" (target: u32, level: i32, format: u32, type: u32, bufSize: i32, pixels: rawptr);
impl_GetnUniformdv:                            proc "c" (program: u32, location: i32, bufSize: i32, params: [^]f64);
impl_GetnUniformfv:                            proc "c" (program: u32, location: i32, bufSize: i32, params: [^]f32);
impl_GetnUniformiv:                            proc "c" (program: u32, location: i32, bufSize: i32, params: [^]i32);
impl_GetnUniformuiv:                           proc "c" (program: u32, location: i32, bufSize: i32, params: [^]u32);
impl_ReadnPixels:                              proc "c" (x: i32, y: i32, width: i32, height: i32, format: u32, type: u32, bufSize: i32, data: rawptr);
impl_GetnMapdv:                                proc "c" (target: u32, query: u32, bufSize: i32, v: ^f64);
impl_GetnMapfv:                                proc "c" (target: u32, query: u32, bufSize: i32, v: ^f32);
impl_GetnMapiv:                                proc "c" (target: u32, query: u32, bufSize: i32, v: ^i32);
impl_GetnPixelMapusv:                          proc "c" (map_: u32, bufSize: i32, values: ^u16);
impl_GetnPixelMapfv:                           proc "c" (map_: u32, bufSize: i32, values: ^f32);
impl_GetnPixelMapuiv:                          proc "c" (map_: u32, bufSize: i32, values: ^u32);
impl_GetnPolygonStipple:                       proc "c" (bufSize: i32, pattern: ^u8);
impl_GetnColorTable:                           proc "c" (target: u32, format: u32, type: u32, bufSize: i32, table: rawptr);
impl_GetnConvolutionFilter:                    proc "c" (target: u32, format: u32, type: u32, bufSize: i32, image: rawptr);
impl_GetnSeparableFilter:                      proc "c" (target: u32, format: u32, type: u32, rowBufSize: i32, row: rawptr, columnBufSize: i32, column: rawptr, span: rawptr);
impl_GetnHistogram:                            proc "c" (target: u32, reset: u8, format: u32, type: u32, bufSize: i32, values: rawptr);
impl_GetnMinmax:                               proc "c" (target: u32, reset: u8, format: u32, type: u32, bufSize: i32, values: rawptr);
impl_TextureBarrier:                           proc "c" ();
impl_glGetUnsignedBytevEXT:                    proc "c" (pname: u32, data: ^byte);
impl_TexPageCommitmentARB:                     proc "c"(target: u32,
														level: i32,
														xoffset: i32,
														yoffset: i32,
														zoffset: i32,
														width: i32,
														height: i32,
														depth: i32,
														commit: bool);

load_4_5 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_ClipControl,                              "glClipControl");
	set_proc_address(&impl_CreateTransformFeedbacks,                 "glCreateTransformFeedbacks");
	set_proc_address(&impl_TransformFeedbackBufferBase,              "glTransformFeedbackBufferBase");
	set_proc_address(&impl_TransformFeedbackBufferRange,             "glTransformFeedbackBufferRange");
	set_proc_address(&impl_GetTransformFeedbackiv,                   "glGetTransformFeedbackiv");
	set_proc_address(&impl_GetTransformFeedbacki_v,                  "glGetTransformFeedbacki_v");
	set_proc_address(&impl_GetTransformFeedbacki64_v,                "glGetTransformFeedbacki64_v");
	set_proc_address(&impl_CreateBuffers,                            "glCreateBuffers");
	set_proc_address(&impl_NamedBufferStorage,                       "glNamedBufferStorage");
	set_proc_address(&impl_NamedBufferData,                          "glNamedBufferData");
	set_proc_address(&impl_NamedBufferSubData,                       "glNamedBufferSubData");
	set_proc_address(&impl_CopyNamedBufferSubData,                   "glCopyNamedBufferSubData");
	set_proc_address(&impl_ClearNamedBufferData,                     "glClearNamedBufferData");
	set_proc_address(&impl_ClearNamedBufferSubData,                  "glClearNamedBufferSubData");
	set_proc_address(&impl_MapNamedBuffer,                           "glMapNamedBuffer");
	set_proc_address(&impl_MapNamedBufferRange,                      "glMapNamedBufferRange");
	set_proc_address(&impl_UnmapNamedBuffer,                         "glUnmapNamedBuffer");
	set_proc_address(&impl_FlushMappedNamedBufferRange,              "glFlushMappedNamedBufferRange");
	set_proc_address(&impl_GetNamedBufferParameteriv,                "glGetNamedBufferParameteriv");
	set_proc_address(&impl_GetNamedBufferParameteri64v,              "glGetNamedBufferParameteri64v");
	set_proc_address(&impl_GetNamedBufferPointerv,                   "glGetNamedBufferPointerv");
	set_proc_address(&impl_GetNamedBufferSubData,                    "glGetNamedBufferSubData");
	set_proc_address(&impl_CreateFramebuffers,                       "glCreateFramebuffers");
	set_proc_address(&impl_NamedFramebufferRenderbuffer,             "glNamedFramebufferRenderbuffer");
	set_proc_address(&impl_NamedFramebufferParameteri,               "glNamedFramebufferParameteri");
	set_proc_address(&impl_NamedFramebufferTexture,                  "glNamedFramebufferTexture");
	set_proc_address(&impl_NamedFramebufferTextureLayer,             "glNamedFramebufferTextureLayer");
	set_proc_address(&impl_NamedFramebufferDrawBuffer,               "glNamedFramebufferDrawBuffer");
	set_proc_address(&impl_NamedFramebufferDrawBuffers,              "glNamedFramebufferDrawBuffers");
	set_proc_address(&impl_NamedFramebufferReadBuffer,               "glNamedFramebufferReadBuffer");
	set_proc_address(&impl_InvalidateNamedFramebufferData,           "glInvalidateNamedFramebufferData");
	set_proc_address(&impl_InvalidateNamedFramebufferSubData,        "glInvalidateNamedFramebufferSubData");
	set_proc_address(&impl_ClearNamedFramebufferiv,                  "glClearNamedFramebufferiv");
	set_proc_address(&impl_ClearNamedFramebufferuiv,                 "glClearNamedFramebufferuiv");
	set_proc_address(&impl_ClearNamedFramebufferfv,                  "glClearNamedFramebufferfv");
	set_proc_address(&impl_ClearNamedFramebufferfi,                  "glClearNamedFramebufferfi");
	set_proc_address(&impl_BlitNamedFramebuffer,                     "glBlitNamedFramebuffer");
	set_proc_address(&impl_CheckNamedFramebufferStatus,              "glCheckNamedFramebufferStatus");
	set_proc_address(&impl_GetNamedFramebufferParameteriv,           "glGetNamedFramebufferParameteriv");
	set_proc_address(&impl_GetNamedFramebufferAttachmentParameteriv, "glGetNamedFramebufferAttachmentParameteriv");
	set_proc_address(&impl_CreateRenderbuffers,                      "glCreateRenderbuffers");
	set_proc_address(&impl_NamedRenderbufferStorage,                 "glNamedRenderbufferStorage");
	set_proc_address(&impl_NamedRenderbufferStorageMultisample,      "glNamedRenderbufferStorageMultisample");
	set_proc_address(&impl_GetNamedRenderbufferParameteriv,          "glGetNamedRenderbufferParameteriv");
	set_proc_address(&impl_CreateTextures,                           "glCreateTextures");
	set_proc_address(&impl_TextureBuffer,                            "glTextureBuffer");
	set_proc_address(&impl_TextureBufferRange,                       "glTextureBufferRange");
	set_proc_address(&impl_TextureStorage1D,                         "glTextureStorage1D");
	set_proc_address(&impl_TextureStorage2D,                         "glTextureStorage2D");
	set_proc_address(&impl_TextureStorage3D,                         "glTextureStorage3D");
	set_proc_address(&impl_TextureStorage2DMultisample,              "glTextureStorage2DMultisample");
	set_proc_address(&impl_TextureStorage3DMultisample,              "glTextureStorage3DMultisample");
	set_proc_address(&impl_TextureSubImage1D,                        "glTextureSubImage1D");
	set_proc_address(&impl_TextureSubImage2D,                        "glTextureSubImage2D");
	set_proc_address(&impl_TextureSubImage3D,                        "glTextureSubImage3D");
	set_proc_address(&impl_CompressedTextureSubImage1D,              "glCompressedTextureSubImage1D");
	set_proc_address(&impl_CompressedTextureSubImage2D,              "glCompressedTextureSubImage2D");
	set_proc_address(&impl_CompressedTextureSubImage3D,              "glCompressedTextureSubImage3D");
	set_proc_address(&impl_CopyTextureSubImage1D,                    "glCopyTextureSubImage1D");
	set_proc_address(&impl_CopyTextureSubImage2D,                    "glCopyTextureSubImage2D");
	set_proc_address(&impl_CopyTextureSubImage3D,                    "glCopyTextureSubImage3D");
	set_proc_address(&impl_TextureParameterf,                        "glTextureParameterf");
	set_proc_address(&impl_TextureParameterfv,                       "glTextureParameterfv");
	set_proc_address(&impl_TextureParameteri,                        "glTextureParameteri");
	set_proc_address(&impl_TextureParameterIiv,                      "glTextureParameterIiv");
	set_proc_address(&impl_TextureParameterIuiv,                     "glTextureParameterIuiv");
	set_proc_address(&impl_TextureParameteriv,                       "glTextureParameteriv");
	set_proc_address(&impl_GenerateTextureMipmap,                    "glGenerateTextureMipmap");
	set_proc_address(&impl_BindTextureUnit,                          "glBindTextureUnit");
	set_proc_address(&impl_GetTextureImage,                          "glGetTextureImage");
	set_proc_address(&impl_GetCompressedTextureImage,                "glGetCompressedTextureImage");
	set_proc_address(&impl_GetTextureLevelParameterfv,               "glGetTextureLevelParameterfv");
	set_proc_address(&impl_GetTextureLevelParameteriv,               "glGetTextureLevelParameteriv");
	set_proc_address(&impl_GetTextureParameterfv,                    "glGetTextureParameterfv");
	set_proc_address(&impl_GetTextureParameterIiv,                   "glGetTextureParameterIiv");
	set_proc_address(&impl_GetTextureParameterIuiv,                  "glGetTextureParameterIuiv");
	set_proc_address(&impl_GetTextureParameteriv,                    "glGetTextureParameteriv");
	set_proc_address(&impl_CreateVertexArrays,                       "glCreateVertexArrays");
	set_proc_address(&impl_DisableVertexArrayAttrib,                 "glDisableVertexArrayAttrib");
	set_proc_address(&impl_EnableVertexArrayAttrib,                  "glEnableVertexArrayAttrib");
	set_proc_address(&impl_VertexArrayElementBuffer,                 "glVertexArrayElementBuffer");
	set_proc_address(&impl_VertexArrayVertexBuffer,                  "glVertexArrayVertexBuffer");
	set_proc_address(&impl_VertexArrayVertexBuffers,                 "glVertexArrayVertexBuffers");
	set_proc_address(&impl_VertexArrayAttribBinding,                 "glVertexArrayAttribBinding");
	set_proc_address(&impl_VertexArrayAttribFormat,                  "glVertexArrayAttribFormat");
	set_proc_address(&impl_VertexArrayAttribIFormat,                 "glVertexArrayAttribIFormat");
	set_proc_address(&impl_VertexArrayAttribLFormat,                 "glVertexArrayAttribLFormat");
	set_proc_address(&impl_VertexArrayBindingDivisor,                "glVertexArrayBindingDivisor");
	set_proc_address(&impl_GetVertexArrayiv,                         "glGetVertexArrayiv");
	set_proc_address(&impl_GetVertexArrayIndexediv,                  "glGetVertexArrayIndexediv");
	set_proc_address(&impl_GetVertexArrayIndexed64iv,                "glGetVertexArrayIndexed64iv");
	set_proc_address(&impl_CreateSamplers,                           "glCreateSamplers");
	set_proc_address(&impl_CreateProgramPipelines,                   "glCreateProgramPipelines");
	set_proc_address(&impl_CreateQueries,                            "glCreateQueries");
	set_proc_address(&impl_GetQueryBufferObjecti64v,                 "glGetQueryBufferObjecti64v");
	set_proc_address(&impl_GetQueryBufferObjectiv,                   "glGetQueryBufferObjectiv");
	set_proc_address(&impl_GetQueryBufferObjectui64v,                "glGetQueryBufferObjectui64v");
	set_proc_address(&impl_GetQueryBufferObjectuiv,                  "glGetQueryBufferObjectuiv");
	set_proc_address(&impl_MemoryBarrierByRegion,                    "glMemoryBarrierByRegion");
	set_proc_address(&impl_GetTextureSubImage,                       "glGetTextureSubImage");
	set_proc_address(&impl_GetCompressedTextureSubImage,             "glGetCompressedTextureSubImage");
	set_proc_address(&impl_GetGraphicsResetStatus,                   "glGetGraphicsResetStatus");
	set_proc_address(&impl_GetnCompressedTexImage,                   "glGetnCompressedTexImage");
	set_proc_address(&impl_GetnTexImage,                             "glGetnTexImage");
	set_proc_address(&impl_GetnUniformdv,                            "glGetnUniformdv");
	set_proc_address(&impl_GetnUniformfv,                            "glGetnUniformfv");
	set_proc_address(&impl_GetnUniformiv,                            "glGetnUniformiv");
	set_proc_address(&impl_GetnUniformuiv,                           "glGetnUniformuiv");
	set_proc_address(&impl_ReadnPixels,                              "glReadnPixels");
	set_proc_address(&impl_GetnMapdv,                                "glGetnMapdv");
	set_proc_address(&impl_GetnMapfv,                                "glGetnMapfv");
	set_proc_address(&impl_GetnMapiv,                                "glGetnMapiv");
	set_proc_address(&impl_GetnPixelMapfv,                           "glGetnPixelMapfv");
	set_proc_address(&impl_GetnPixelMapuiv,                          "glGetnPixelMapuiv");
	set_proc_address(&impl_GetnPixelMapusv,                          "glGetnPixelMapusv");
	set_proc_address(&impl_GetnPolygonStipple,                       "glGetnPolygonStipple");
	set_proc_address(&impl_GetnColorTable,                           "glGetnColorTable");
	set_proc_address(&impl_GetnConvolutionFilter,                    "glGetnConvolutionFilter");
	set_proc_address(&impl_GetnSeparableFilter,                      "glGetnSeparableFilter");
	set_proc_address(&impl_GetnHistogram,                            "glGetnHistogram");
	set_proc_address(&impl_GetnMinmax,                               "glGetnMinmax");
	set_proc_address(&impl_TextureBarrier,                           "glTextureBarrier");
	set_proc_address(&impl_glGetUnsignedBytevEXT,                    "glGetUnsignedBytevEXT");
	set_proc_address(&impl_TexPageCommitmentARB,                    "glTexPageCommitmentARB");
}


// VERSION_4_6
impl_SpecializeShader:               proc "c" (shader: u32, pEntryPoint: ^u8, numSpecializationConstants: u32, pConstantIndex: ^u32, pConstantValue: ^u32);
impl_MultiDrawArraysIndirectCount:   proc "c" (mode: i32, indirect: rawptr, drawcount: int, maxdrawcount, stride: i32);
impl_MultiDrawElementsIndirectCount: proc "c" (mode: i32, type: i32, indirect: rawptr, drawcount: int, maxdrawcount, stride: i32);
impl_PolygonOffsetClamp:             proc "c" (factor, units, clamp: f32);

load_4_6 :: proc(set_proc_address: Set_Proc_Address_Type) {
	set_proc_address(&impl_SpecializeShader,               "glSpecializeShader");
	set_proc_address(&impl_MultiDrawArraysIndirectCount,   "glMultiDrawArraysIndirectCount");
	set_proc_address(&impl_MultiDrawElementsIndirectCount, "glMultiDrawElementsIndirectCount");
	set_proc_address(&impl_PolygonOffsetClamp,             "glPolygonOffsetClamp");
}

init :: proc(set_proc_address: Set_Proc_Address_Type) {
	// Placeholder for loading maximum supported version
}


