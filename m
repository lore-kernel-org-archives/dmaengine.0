Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.69
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793820855;
	b=XUPEdiEzO+z9/bgR7A+XlQZgJHeVfbHOrxCYPn7vb3H60N5YZjWlikhWSEU1Nnyu3tU+
	 Q/pPhRx4MusLLjAMMNEIvK6bj0pIuanpE/q1pO32Af4l4oMW//Jw5AxsGQkuwh2dHnAGC
	 srgf3wcdM69kqVRmVTL0RyiwPUiGTlydCS68Hctvq2HTEKBTV6cLloI9jwbQmNs3zoWUK
	 B9/DJyGz1MVcBP101aNWb1ypHsMxaR7tZCbqvABWENq8eFenIuhCiP8lUFsF08YBcRadn
	 Ji5auOFZtRSOhcorCazzMBfrEbn7BY4xK/hp/jaIRcXbdtr4SEWd9BeGZBsScqRhtgQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793820855;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 In-Reply-To:X-ClientProxiedBy:MIME-Version:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=dL2WFBSmlk8Y1gDAPXRKdH7GOgRBFZpN7SPvEv8a3hE=;
	b=lt6OZ4c55Fahu6pk/BMzewe3UVI1dFMNFuL41VofDL4efurBMYoGsYqQ6RaLW2qZiriJ
	 1HzFjlqiNP30CQ486TDW9/MNXge8H/VdOfVZKho/paNbQOCjKp/8QG7mLUH2P+l8eT3Wg
	 /j4/NzeVmaPGDzx0sXRO3af9tTIjhd4++KEKeI9+2/JhtK8Y2ezp97W7y704Eel/pA8lo
	 hKXOZflnSwLJZCd1m8ZSJt9iWTozpK/6/V1lw0QXVNYrHdaS875BN0YQdDScYmk4UfTNG
	 i7mcDfyys+Lb1WhI+o3nGZ9wzKFi3dE1XtrYB7uXfx9BdDEUFT5aUHpab8zpwvHZC2g==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZhvDERP3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.69
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012069.outbound.protection.outlook.com [52.101.66.69])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C18EC606E80D;
	Wed,  4 Nov 2026 19:34:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C18EC606E80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=ZhvDERP3
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=doDJv99C31R1QqHpTaObGA6wzQRbUbEuVMXDG/ZEk0/AkULdnly6DZ+M70DdEYoX6Rts55fzPgNGzvvVWZhCcyl7v6YeOO1CVmNs3m7FiKUEge+zzaoTSLCj/nk4O7FBqo/P1kw2xZ62Se38erGoe4w0+5ArRr/RewbXoA9eDxwgkHOEaEKjI+qDXzW1vAjlMYGhQ16q3hwv4+HBfuP2MkiKjEBIcDB3pbItXytWWsBJckiUumm+cckRVTQ/dTnkDLiTLTc4lCaDqhWrWeS7l9z5ooHAmY6+IoBArYJC7WUX88qx1k0KgR08qfeScqgeHBXb+pXDfJpuH5z2N3aC3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dL2WFBSmlk8Y1gDAPXRKdH7GOgRBFZpN7SPvEv8a3hE=;
 b=aq6J6lcHsiLb1bsrzm4+6q6EEmej53mBMGIB2w9fvVTYMx8WoNSvvmGxdxFwvQKSiUPO19N9a69pZQ3xb9WByUcgolt3u8Jy1YbNYF9WhwMBGBaPnI9cUnuRS9JjkRqRmoLdSwavf/N0tA5frAzIqhmiUERzfA2VKK8sd+bshwAy00buoOQNmXijiLnoo44KM4P1bsKn3hTy0MrvQLVI2LYwAjB3nh/yWj5XC1iojceKs5Y9Ob/L5yMtWVjw2WOq7hkWNvLv9gRy9JTy3CfuNbAleru1PSPf5rP8jJB7E/OADQ1nZCxgudw9cJ5KGl2hpYciWaCjMeMBbygzKMQ21g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dL2WFBSmlk8Y1gDAPXRKdH7GOgRBFZpN7SPvEv8a3hE=;
 b=ZhvDERP3gOJJuzWYN2xC+aTZeChSPDyBeEup1eVx+Us0zfyrQEwRjSTSExad488YdGNxHrMytr8OFZRUYe/VopNMJZCqnkr5eg22ribjvMycc5e7Fe9ABF2kjzQt5pGWjQVe2X72CuhwDUFcgP7swnM1PLtAs/9w9DECtSf3nLAlt82e9M0xkONM90wT9Xy0nZ6WF5C5WyHfZ+bT7Qv471Jm5IqvwCFIBgQkGVflV1gZUPYrnmaMRUtxSee5iw/fU15QswyBuh0fFax82IgBgB72JmCk1oBOl79cuGu8NnK33ZuGV8AYtFb8eyH06CquipX0TXffirU6iIpnMt99pA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMCPR04MB12646.eurprd04.prod.outlook.com (2603:10a6:20b:770::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 19:34:12 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0592.007; Wed, 4 Nov 2026
 19:34:11 +0000
Date: Wed, 4 Nov 2026 13:34:04 -0600
From: Frank Li <Frank.li@oss.nxp.com>
To: Jelly Jia <Jelly.Jia@cixtech.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] dt-bindings: dma: arm,dma-350: Document optional
 clocks and resets
Message-ID: <auuIrNTtrm7Tn4vb@SMW015318>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
 <20261104124411.296640-4-Jelly.Jia@cixtech.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261104124411.296640-4-Jelly.Jia@cixtech.com>
X-ClientProxiedBy: DS7PR03CA0057.namprd03.prod.outlook.com
 (2603:10b6:5:3b5::32) To MI3PR04MB12438.eurprd04.prod.outlook.com
 (2603:10a6:290:76::14)
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMCPR04MB12646:EE_
X-MS-Office365-Filtering-Correlation-Id: 5a1d5439-7d92-46b8-e9d9-08df3aaa9a3d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|19092799006|7416014|1800799024|366016|23010399003|6133799003|10067099003|22082099003|18002099003|261102123227099003|4143699003|261021123027099003|11063799006|261022105027099003|261009223027099003|261028144727099003|261021121427099003|56012099006|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	sciOV+bABh+ohmJxjSp4k/e2vOe7T24HA0DNi0cTBNATGHj9op1IOT2oN26rmH73Lpgz8CFIbNe6UVzwCNYTZ9MmeG4GHok6lGH9fUBa4KRbpvCXeM5ZYtxHGXl+Q49bzMx7rf/CeCpdrOKl9Zh+FJf2pa4h61oF61vkWMT2+vX6C7iUguWf2FmfMxp3Ec3pUKpcnzYobZaArfXPdkpSN0546AG3aVOohqLVpPUeNC3/R3lQPB6+fxXP3OqxgARtDbX8xEiutN8r9NPD5NteVvP6tgmupXUm5EvCpe8bfQ3mzxe456XxiTrZ9eqFNpKLXnsVxvxMBlTTMCTVdDhY2s+QBbJ+TXrh69JsbcmsINBTC2+/+aZPRYw4xJQJezB/J8AHLjeYaAiFzpPzPuL5oh8iNb+MEh5COOORD8D9HsRlZmSGaBghnasmuVobOZplJnzwPljJbkfyGS6InR45EjUg3OKjnsrkSuBckjo03HXGAfQqNjoqcky4w+iOa+zE6chuxbs/qk30HV5J8R2PxCc1xFFUtqeA1F0UwSrt3ewWvc05JufnWMSznCC1SwETZ3m5NKCfqVY30mY0Q9opznbYG3U5hYZqozaCC2XapecSoUR9+PIaL5NJDJPri2/IfzHO4JTe0OmSFw0ibUeKB6lN1EOJnl58sCzGcailhYM=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(19092799006)(7416014)(1800799024)(366016)(23010399003)(6133799003)(10067099003)(22082099003)(18002099003)(261102123227099003)(4143699003)(261021123027099003)(11063799006)(261022105027099003)(261009223027099003)(261028144727099003)(261021121427099003)(56012099006)(261026121527099003)(261026140227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IOawZ+yPz3+7SS08Bo8xCHQKN7+TlZZKgWcA3D3/29klbG3dJv7FjIXQKyIr?=
 =?us-ascii?Q?UvipBak9kIJTlpu6nMiX3DjWq4A+cdBXcTOrSXaz0OibUIAkdsawDcw0Yhq8?=
 =?us-ascii?Q?r5h4u/7akVqVPXv2E8X9l/6XLj9cvTitbG2pvJkVDneFaZVJmMVnZgjz5V7S?=
 =?us-ascii?Q?FuN8uhHpVoz0yVo208vRfyhxqz6jUHDrBcGC87Ems7YW67PJ165mBEF/K/ep?=
 =?us-ascii?Q?Llkc1P488F0+dgAiQfqAnqhi0XrB29Bb9sed/uS8V89gHhTHWmLacfdgStuC?=
 =?us-ascii?Q?NYPR8rpEQ4MMmqt4SJoOG2TucUtJo5Z71gTkNrvj5mOTkJSq4yNlMhLByI6+?=
 =?us-ascii?Q?AzbI0mheZGUi7ku/cOf1Q/QTZkhJQ6LxV9BzEz4VCdcvQOgeTJ3kMdrfSjE+?=
 =?us-ascii?Q?BooEFYUNP4h5trMTQkQ/EMCiGQD9zBG3TmZZwaKQsfkt9gvuprX/2DPB4Hhw?=
 =?us-ascii?Q?xO1Cfnl4N7stVG+nvDjcHPCMVYhbNm+bt08Zsat9GpZkkuk21TOcPNJzaccC?=
 =?us-ascii?Q?PdlTPUcVffuaLzDRUTI15MJw++tZYDtsYvc1LYyO+eKk3jEjo61QSi4fLt1K?=
 =?us-ascii?Q?KxNMSAKtFV4zUY+nVKvc0s5VyRR+0f3/Tg4WW5l+6s5JqcT+DLuSxuf1R1wN?=
 =?us-ascii?Q?ttC3H1cmKimtkZ13Gu6dthup09Wid8wxtCkFo+Nitv0AWoPXCK1rkDATH2Lq?=
 =?us-ascii?Q?2ks6eU0Es3MOzv77iAcvv67O6wNbMN5fsWYHNYF3Ri6fM0GUbSEeSrXEl6J2?=
 =?us-ascii?Q?MH90pkyYUZXGr/bzB4t7DhYPQswaj6gMkrWcEchKamyGkgHwic4Uo6L6teCt?=
 =?us-ascii?Q?DPqbssm0DBHrRZiv5nvS6KkoWHkhHReqq33k102bTIBJF9619QAkLCt0fepj?=
 =?us-ascii?Q?qTP60JlW0oY2oSLWVZJj8Psnta4yZfWPXbHyf0DGXDNLQkRexYmrkzvTPUto?=
 =?us-ascii?Q?6I/ZLXVyBLSLWOc5E9a1jZDzUBH4gjNhLvpiE104yoDisYx1cHMeAgPE4y8v?=
 =?us-ascii?Q?OfhYQ4f1kMny0oRGOq5c1i0H/9cS21LlL0zUGw3l5FR/vlaouM793p7mrf0h?=
 =?us-ascii?Q?sCJ0Afiy3yhjo7TketPXorPn4tAWlOM6C0unTYicgEAuVbfNRGy9y+5BR4Mu?=
 =?us-ascii?Q?VgaXKw4sF2JC48UQlK8K9PP1Dms6XBN3j4fKRJ01VGxU6Tw++97rrTFvt7JQ?=
 =?us-ascii?Q?YJHIAay6xBdAhBMl4TngekO+JJeF1Q3Av/NkkMZq8HrfHikVTXwoPqxIFXRl?=
 =?us-ascii?Q?5xvXzWnGBSiANtjVODFrNedddQnlLcP01epRo2lz8vwACCyogOxOMzAhVHUb?=
 =?us-ascii?Q?7+GORyTNjrM1m5ZX3urlprELYTw6VZNyEVG6a2hby1boVRLxBpdUqfJ+hDhG?=
 =?us-ascii?Q?f0algy6GrdywZ/6gL5B9Yv5H+dFigjbAPhqVW/jwUAH7rm/l0649CUf4eLUo?=
 =?us-ascii?Q?3euPfbR6h9SWfFqBpxNvr75D2QcrykvtWJhuR50Ji9PlYPr/SVBUHYUpUVPE?=
 =?us-ascii?Q?NkbBmJj3JbZXz1fqlzLK5btNMp8YuQK1uaDUt0YRoURQ969j9VlsVqiVFTdj?=
 =?us-ascii?Q?BARshI/cgsUSuT6TWcikwr9R9FuxHxXbYvI0ybLx3gmjCpWIDjMA1K1Y76HL?=
 =?us-ascii?Q?SHkUlaM0tFta/7OLU7sAJH0qGHCV0of1BMzdxtbYTqaUq7iqxLJxa9mTpyHX?=
 =?us-ascii?Q?80jLKCOnykemGxJwHk6X1Car0dtORnQvWuxWJeKKCAwSAzTBHIMyyJkkr/3y?=
 =?us-ascii?Q?tO+uiuScLm9c8qy+fwK/lzT+Pijv0NqfFVRqaXj5eW/PiWM9AlZC?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5a1d5439-7d92-46b8-e9d9-08df3aaa9a3d
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 19:34:11.8265
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vxh+Wmde/X5L1GzGzbcVlQGO3MoQ7qRuwi/uYt/b9nfsTa4J7GThdelML86k6g2/SYXee8EdeAnl656LpmGoxfaGZ2EkM5QkraeoPoEwLj/g8yUDT3OzQ1RNeSgmwqgx
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMCPR04MB12646

On Wed, Nov 04, 2026 at 08:44:09PM +0800, Jelly Jia wrote:
> Some integrations gate the DMA-350 controller with a bus clock or hold it
> in reset. Sky1 provides a clock for both its FCH and AUDSS instances, and
> a reset for the AUDSS instance. Document these standard resources on the
> DMA controller node.
>
> Neither property is required, so existing device trees are unchanged.
>
> Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
> ---
>  .../devicetree/bindings/dma/arm,dma-350.yaml     | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> index 429f682f15d8..43279878207c 100644
> --- a/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> +++ b/Documentation/devicetree/bindings/dma/arm,dma-350.yaml
> @@ -9,9 +9,6 @@ title: Arm CoreLink DMA-350 Controller
>  maintainers:
>    - Robin Murphy <robin.murphy@arm.com>
>
> -allOf:
> -  - $ref: dma-controller.yaml#
> -
>  properties:
>    compatible:
>      const: arm,dma-350

Suppose you should add front compatible string and fall back to arm,dma-350

and use front compatible at if branch to restrict clocks and resets.

Frank

> @@ -36,9 +33,22 @@ properties:
>      const: 1
>      description: The cell is the trigger input number
>
> +  clocks:
> +    maxItems: 1
> +    description:
> +      Optional bus clock, where the integration gates the controller clock.
> +
> +  resets:
> +    maxItems: 1
> +    description:
> +      Optional reset line, where the integration exposes one.
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
>
> +allOf:
> +  - $ref: dma-controller.yaml#
> +
>  unevaluatedProperties: false
> --
> 2.54.0
>
