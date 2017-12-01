// Shader created with Shader Forge v1.34 
// Shader Forge (c) Neat Corporation / Joachim Holmer - http://www.acegikmo.com/shaderforge/
// Note: Manually altering this data may prevent you from opening it in Shader Forge
/*SF_DATA;ver:1.34;sub:START;pass:START;ps:flbk:,iptp:0,cusa:False,bamd:0,lico:1,lgpr:1,limd:0,spmd:1,trmd:0,grmd:0,uamb:True,mssp:True,bkdf:False,hqlp:False,rprd:False,enco:False,rmgx:True,rpth:0,vtps:0,hqsc:True,nrmq:1,nrsp:0,vomd:0,spxs:False,tesm:0,olmd:1,culm:2,bsrc:0,bdst:0,dpts:2,wrdp:False,dith:0,atcv:False,rfrpo:True,rfrpn:Refraction,coma:15,ufog:True,aust:True,igpj:True,qofs:0,qpre:3,rntp:2,fgom:False,fgoc:True,fgod:False,fgor:False,fgmd:0,fgcr:0,fgcg:0,fgcb:0,fgca:1,fgde:0.01,fgrn:0,fgrf:300,stcl:False,stva:128,stmr:255,stmw:255,stcp:6,stps:0,stfa:0,stfz:0,ofsf:0,ofsu:0,f2p0:False,fnsp:True,fnfb:True;n:type:ShaderForge.SFN_Final,id:4795,x:32913,y:32691,varname:node_4795,prsc:2|emission-9671-OUT;n:type:ShaderForge.SFN_Tex2d,id:6074,x:32056,y:32527,ptovrint:False,ptlb:MainTex,ptin:_MainTex,varname:_MainTex,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False;n:type:ShaderForge.SFN_Vector1,id:9248,x:32348,y:33320,varname:node_9248,prsc:2,v1:1;n:type:ShaderForge.SFN_Tex2d,id:5894,x:32042,y:32695,ptovrint:False,ptlb:node_5894,ptin:_node_5894,varname:node_5894,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-1933-UVOUT;n:type:ShaderForge.SFN_Panner,id:1933,x:31626,y:32789,varname:node_1933,prsc:2,spu:0,spv:-0.4|UVIN-1876-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:1876,x:31558,y:32639,varname:node_1876,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Multiply,id:7403,x:32357,y:32537,varname:node_7403,prsc:2|A-6074-RGB,B-5894-RGB;n:type:ShaderForge.SFN_Multiply,id:5359,x:32399,y:32942,varname:node_5359,prsc:2|A-6074-A,B-5894-A,C-9659-A,D-9659-RGB;n:type:ShaderForge.SFN_VertexColor,id:9659,x:32045,y:33072,varname:node_9659,prsc:2;n:type:ShaderForge.SFN_Tex2d,id:8347,x:34860,y:32722,ptovrint:False,ptlb: UV TEX_copy,ptin:_UVTEX_copy,varname:_UVTEX_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,ntxv:0,isnm:False|UVIN-30-UVOUT;n:type:ShaderForge.SFN_TexCoord,id:6361,x:34492,y:32730,varname:node_6361,prsc:2,uv:0,uaff:False;n:type:ShaderForge.SFN_Panner,id:30,x:34671,y:32704,varname:node_30,prsc:2,spu:0.05,spv:0|UVIN-6361-UVOUT;n:type:ShaderForge.SFN_Color,id:7949,x:34897,y:32930,ptovrint:False,ptlb:UV COLOR_copy,ptin:_UVCOLOR_copy,varname:_UVCOLOR_copy,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:9671,x:32629,y:32942,varname:node_9671,prsc:2|A-3162-OUT,B-5359-OUT,C-3904-RGB,D-9248-OUT,E-9659-A;n:type:ShaderForge.SFN_Color,id:3904,x:32333,y:33160,ptovrint:False,ptlb:node_3904,ptin:_node_3904,varname:node_3904,prsc:2,glob:False,taghide:False,taghdr:False,tagprd:False,tagnsco:False,tagnrm:False,c1:0.5,c2:0.5,c3:0.5,c4:1;n:type:ShaderForge.SFN_Multiply,id:3162,x:32442,y:32749,varname:node_3162,prsc:2|A-7403-OUT,B-9659-RGB;proporder:6074-5894-3904;pass:END;sub:END;*/

Shader "custom/fuhuotai" {
    Properties {
        _MainTex ("MainTex", 2D) = "white" {}
        _node_5894 ("node_5894", 2D) = "white" {}
        _node_3904 ("node_3904", Color) = (0.5,0.5,0.5,1)
    }
    SubShader {
        Tags {
            "IgnoreProjector"="True"
            "Queue"="Transparent"
            "RenderType"="Transparent"
        }
        Pass {
            Name "FORWARD"
            Tags {
                "LightMode"="ForwardBase"
            }
            Blend One One
            Cull Off
            ZWrite Off
            
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag
            #define UNITY_PASS_FORWARDBASE
            #include "UnityCG.cginc"
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma only_renderers d3d9 d3d11 glcore gles gles3 metal 
            #pragma target 3.0
            uniform float4 _TimeEditor;
            uniform sampler2D _MainTex; uniform float4 _MainTex_ST;
            uniform sampler2D _node_5894; uniform float4 _node_5894_ST;
            uniform float4 _node_3904;
            struct VertexInput {
                float4 vertex : POSITION;
                float2 texcoord0 : TEXCOORD0;
                float4 vertexColor : COLOR;
            };
            struct VertexOutput {
                float4 pos : SV_POSITION;
                float2 uv0 : TEXCOORD0;
                float4 vertexColor : COLOR;
                UNITY_FOG_COORDS(1)
            };
            VertexOutput vert (VertexInput v) {
                VertexOutput o = (VertexOutput)0;
                o.uv0 = v.texcoord0;
                o.vertexColor = v.vertexColor;
                o.pos = mul(UNITY_MATRIX_MVP, v.vertex );
                UNITY_TRANSFER_FOG(o,o.pos);
                return o;
            }
            float4 frag(VertexOutput i, float facing : VFACE) : COLOR {
                float isFrontFace = ( facing >= 0 ? 1 : 0 );
                float faceSign = ( facing >= 0 ? 1 : -1 );
////// Lighting:
////// Emissive:
                float4 _MainTex_var = tex2D(_MainTex,TRANSFORM_TEX(i.uv0, _MainTex));
                float4 node_5837 = _Time + _TimeEditor;
                float2 node_1933 = (i.uv0+node_5837.g*float2(0,-0.4));
                float4 _node_5894_var = tex2D(_node_5894,TRANSFORM_TEX(node_1933, _node_5894));
                float3 emissive = (((_MainTex_var.rgb*_node_5894_var.rgb)*i.vertexColor.rgb)*(_MainTex_var.a*_node_5894_var.a*i.vertexColor.a*i.vertexColor.rgb)*_node_3904.rgb*1.0*i.vertexColor.a);
                float3 finalColor = emissive;
                fixed4 finalRGBA = fixed4(finalColor,1);
                UNITY_APPLY_FOG_COLOR(i.fogCoord, finalRGBA, fixed4(0,0,0,1));
                return finalRGBA;
            }
            ENDCG
        }
    }
    CustomEditor "ShaderForgeMaterialInspector"
}
