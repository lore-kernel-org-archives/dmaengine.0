Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010033.outbound.protection.outlook.com [52.101.84.33])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64FFC2EEE69;
	Fri, 16 Oct 2026 16:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.33
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167333; cv=fail; b=MrFmj/1CNKNFAXx7BXops5BnmjE47wzbWEZ+It1brA/468N4LHk10mYA32bbRVz9dtnAALDhUMKIdBlMDJ18UVk/hnvXMQFrAOK11VrKULKDtgEx0H84ZMBWnunnjeNfXwX3sYROlssaNhTCSbxjun3q6lD4KD2ITO7O3Lwra/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167333; c=relaxed/simple;
	bh=Ovmi6/NaqYRKjsDBzh5/84QAQ4fd8ADR/chKAG8oRE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=IK4hPPlQiDgD02UEfBDDwR1u+ADZh53iibZMP9ZUDBnSGDq2GoYyoYspmdX62VbkUl7mCq/UmjlEDoAFw/tuKkvjAXW3XfhyWuQhZ2cdj9n0Va03JKHM7OgidEW7YJH07qmqI2BSiNnp7FYBhgx6O5MfRHqRkTNn+/aBt3ORtUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=uULXGInj; arc=fail smtp.client-ip=52.101.84.33
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="uULXGInj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T48weDy+CLG8Lmhs4ehysHLyyhcSOhTvpKdRtK1knQQl+LAulE+jeBSasohqZqzvpe1JOdSmPqa7BsJKCVWRGRa4k2hHrgPAJxK+vsnj/QV+aUcdnT1UMasLI4O+PVEP4Q+aHmsJyozNxbsP8IvI5dwUWTMsuQVldq94uBByGLaOTkkWrKmblLVMaIQqr9zmN66vqarzt8d1XLpYtmB3oPxzFz1VG4ZXzP4rW+9jyPpK/j4GiBFg8SfJIBHE8SKONXD3s9Kx20WiXpKK1HRDmAckr0bE2ZmJunvhQgq2Tokh2tk/haLcwQGeDBg+eb0JB/u70ZzUEKzFJh0cHoBOUg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7GiyUuRfxgmpGA1x90tVgsiZ5q1mojpREeK64iq37E=;
 b=BloVDNhDsJv6OLM7Q3C7fZR7T2MRKZgb7Bt5Aj9RhTx3GlQdhzSGBnDKOIIafIhRAQ5rhh/m4U6pbbAcBO5Z4+2JKf3cjWw2WOpEucjHKqnxIBpDZfth+wvvBu44/FtPFiQ/rVYn7/HKyu/JnmRy0I+f3yJo3MnjE7L9se2sDyTcOvMIJoXvbJ/nM1TQujGL+1y5B78X4WA0vFQJWda1RqTboI76CuTh0AhnQcCwf0UqJkBHxkk3VIGSEjEYJLfc/ief8Gqf7PB8Bis0aspmceBqU7GjkhAWMbpXWVtCJ68mKMmj7xtTaDu5Fw8a1kBY48DLSsRn/5AEqk4a+ss8JQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=H7GiyUuRfxgmpGA1x90tVgsiZ5q1mojpREeK64iq37E=;
 b=uULXGInj+euCMjpx74YfwYzZvkhc+Izr9RxEGGb/NX9mT7kFN6Z9rpius+z5GPQUNNEdyqFEkxKLCq3VnmtH3DekzBV5idVIIL1hBPeL8An/a8bteBECc/a2greLYLLe5HFdHayT/SQfmCQaobctTFcefyEOpu6o5d8WQNk7vjZN5RAN1BbQh8R8EuDGkh6WavomDb5w8V7T0oryvIdi/yk38Xt+VTf21F6vKHfg5HWL3Ub4gi9NVME3esF5O63kJXHuCMw6z4HX3MZ1R0VEXxDWB0/su+cXPvtEox0f5tUzvDZ+jF3AG2qhFRQCVIQQs3Fddm7Kp5PE37rlpjzlcQ==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11751.eurprd04.prod.outlook.com (2603:10a6:150:2d8::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.13; Fri, 16 Oct
 2026 16:15:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0522.013; Fri, 16 Oct 2026
 16:15:27 +0000
Date: Fri, 16 Oct 2026 12:15:19 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
Cc: konrad.dybcio@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>, bjorn.andersson@oss.qualcomm.com,
	praveen.talari@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
	dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org,
	mukesh.savaliya@oss.qualcomm.com
Subject: Re: [PATCH v2] dmaengine: qcom: gpi: Fix SE ID and SE Protocol
 fields widths in SCRATCH_0
Message-ID: <atJNlzZlA7illyMj@lizhi-Precision-Tower-5810>
References: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260721-fix_se_id_and_se_protocol_fields-v2-1-ee1d63d6c549@oss.qualcomm.com>
X-ClientProxiedBy: PH8PR22CA0006.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::10) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11751:EE_
X-MS-Office365-Filtering-Correlation-Id: 5786c356-092e-4820-c1b9-08df2ba0b11d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|7416014|1800799024|366016|19092799006|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	JguflDuNizRvlcjJBk6kT6sYsREUQVSpRAcV4xo4NUdDsHcUD+qdQWVQiDglO9ban3MebwsqQtdRm71Pxbdj0XfpXq33RXuu8DQOCsZINRegWfaPsrFL23YmZBgeMD7ypqrhGY4++4tOiT9Pxb69Wfxvsn1nX4lCpkBh2PBeYjSeG6KNAz8Hd1w7tP6f0xw5Mc8iNwulkJkY2IjvdmbfEoI/n0GpHYcW7mjG47FRCKdmdMn/h2WW1e3ZQLCmIZrvXKgpNKhozxasnvf8ZtWQtHQMpBfGE8nvv4zVuuILezYIFBlyGVHHc4ajYznncI0Ytzer0HUaj4larvPKS1GUzU5uHHns5yAFDg19M1+uCqNl2VV/KanuJtJtFy1ZUrCX2qOPWPaxbm0OqdwtYZQOtWl8Xt7t+zzku/j9/X6jJfKtNDUB247WHkhx0ph8e+uCmuO/78hsfvT9lIQpP30a0q+2hchKSRI6dZILVD0pG15sVMKbXCrXB8WgsST6xRW56ddMWgUfYswGYVOqCN1q1WIksCO3tzvWBJ9V7QDROQC+TB/etL81TDFSJNx60URjZPrzhtreSXv2Ev8G50mZR4no8dpSxQuXI9OejZKB3TLqm3AAPQoD3Sqs21Lu0+ik
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(7416014)(1800799024)(366016)(19092799006)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Whaexh6pbUsYizkPXwNB+AnwJzYTFzLQYgc8fRM5YAApeAn7LoojE0v/d6F0?=
 =?us-ascii?Q?+EixLDFxowM1x/PB1XsiqigZpDyXsVN3g/BenETbIE+p2mEyykaEa++ggYRk?=
 =?us-ascii?Q?DwKCC8QqeE4xbH+mKUxik5evLSjhWrTW1CskN4Rqhp+0qwfLV2eS8xf2gMtt?=
 =?us-ascii?Q?tTkso7rdIem7k0DW4R615TpYets3PBSi4wWkiEcUJ7getDkYlXg21yC9ax+Z?=
 =?us-ascii?Q?gRh3zlPy6udeSXlsUFwNCjfZwj69ToRqEUWPYdMIzYFzHb0HMrU8rqAnncLW?=
 =?us-ascii?Q?ArhNfbTAVJ0CtsVOAP7XqTYk4YEycUBkwbXWfAu9M9NWqBnYGakx9jdZi4Ky?=
 =?us-ascii?Q?F0tklAN7Hy/3mmXAkZ+/AuxKtXPEQ+HmY7rlvhfUG64C4cjY+31jAVSGvs22?=
 =?us-ascii?Q?O4QkR93XEsDM2MlSJWq7uqKcAZlou0E52gX/cfxRpyUSOWFiaHxijy7fXidu?=
 =?us-ascii?Q?ve4OeOMXO7vJA4uUtn7aSqew1URDbCJQIf1eQ8BTz7r2jkQzHsmXEwqQTJX3?=
 =?us-ascii?Q?BsMF0r1pdiam9yjwE3s2YJf+2PZRN+oTDhSATMmt6M2EJbDpSfMdvFMyk3E7?=
 =?us-ascii?Q?52X6X/4h+VHvsQllZwRGKCE73/tc1OeCBAYpEzCE56wf/RODALyyL9a/InLY?=
 =?us-ascii?Q?IItihIelyevHfG4lpTfxyqv4NMdLdCycgMLDtYDPNrT6tjOuWRQJGTIxLIMi?=
 =?us-ascii?Q?i0YJXGoXeJJRJyNy036BYBKKoIv8E+T99HamgA96ABKVDC2XUZNgL9/viia5?=
 =?us-ascii?Q?jopwFgiA2FYYY8D6loMWZoeUuMSU0oxl+rdZ9KD9V9CCG4S3IEsEa/2X+vLe?=
 =?us-ascii?Q?LPPgrH1UESit/F1OI3zP2RTU1uwGuMaCFCxauTTEBbZf+yZ+SuavSO+Apff3?=
 =?us-ascii?Q?xAcvjIDLEmFaqhXVayW422UTZDPbKRTtGA2rR4dsxbkNA280Sln6zpwQd3rf?=
 =?us-ascii?Q?Fqe7YpNq+2qLZB/yLaSFQJ4NMrRnZ/+J0G6NR0raCD7XAvAd9Poi15y/gQkh?=
 =?us-ascii?Q?RNHy00ejFeIaDYEbdir9tpoP8Ib5onnb9ZXfURvxGCpbqZa+8xZHEzX1ngp4?=
 =?us-ascii?Q?ZJajrcp1FH677kHNVM0FiyUQmi27GVATMrSOl7iE3Ylv+QPFg6J+vlhWshMi?=
 =?us-ascii?Q?MwUvW/YGlTqZcTLsxhg2ijMYk+8EoKWZurOmJPt5/dVnQ5XZih0oO9+HBk2j?=
 =?us-ascii?Q?cGhPgYdZJfpV3/6ZKDoeSIGlC68CKv5Ago5qHgQCVKFNT/tT7FZxmjj40Ic7?=
 =?us-ascii?Q?c7xWVWQ9YV4vwMuSliZbr8321fJ2XtAQ4iYd6phn9szzMK66OJBWweekyrI9?=
 =?us-ascii?Q?W90RyDi7cwsQONURvXorNtJW7nCyjxNcURXXkLn8PR+6EQg5MflLVc8i/PkB?=
 =?us-ascii?Q?3i5vMrMhdNJee2gxV4mFRcTp4dsnNvdNRkWf5sZ7WCSQAYA3XyBMgmQftenf?=
 =?us-ascii?Q?iECkOyQF77hENTLPzHi9Jv4FsZ+v1fPAW4uLdcVG72pjEY6oR/IOelTHx9Ex?=
 =?us-ascii?Q?9AHjm8NE8EvHL5CaHPd2aqx77V7Xn9E/XYLfy7tkfKEIC54sdU0pj82ryjwr?=
 =?us-ascii?Q?BIKoKhYY+4hTsstTMO+4GtYrkTSBFnf8j/6hHNDJTn0Bi1BKzOfX++NOrpmI?=
 =?us-ascii?Q?clpPyardOvkrGgu37sm/O6tyvMATGqB8czSO83OfTem54tbr42pRcJMwiOPb?=
 =?us-ascii?Q?3tXFJubfuOiYBOIyv+Yg87CpLyZ7VHCFif0wWU03hyoDJVropa5aB11RHK+H?=
 =?us-ascii?Q?spGnIItCOGc9ENP+PZH/jHNspT97yPkKarNNR4zl9jTdAYFm9Taw?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5786c356-092e-4820-c1b9-08df2ba0b11d
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2026 16:15:27.8004
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LJBVhg/qiyigmtfvY6f6vHPTP96BfeLf7apSi5j4wWGuhF2wehWXTE5GpLseR0gHxNbAFKDri47tsmzhcP6unnEM6aaBFMpHGiyog6LrUG6AgKvICQxWiuISwuRT23w6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11751

On Tue, Jul 21, 2026 at 04:15:46AM -0700, Chandana Kishori Chiluveru wrote:
> GPII_n_CH_k_SCRATCH_0_SEID is currently defined as GENMASK(2, 0), only
> 3 bits wide. Serial engine indices >= 8 get silently truncated by
> FIELD_PREP()/u32_encode_bits() when written into the scratch register,
> causing the GPI channel to bind to the wrong serial engine. The
> channel allocate command still succeeds (it doesn't require the
> target SE to respond), but the subsequent channel start command times
> out waiting for hardware to complete the handoff to the (incorrectly
> bound) SE, and gpi_send_cmd() returns -EIO leading to GSI usecase failures
> for SE8 and SE9 serial engines.
>
> Older documentation, such as the SDM845 hardware programming guide,
> describes the SE ID field as bits [2:0]. More recent QUP hardware
> documentation defines the field as bits [3:0]. Use the wider definition
> to match current hardware documentation while remaining compatible with
> existing platforms and enabling serial engine IDs greater than 7.
>
> Also update the SE Protocol field definition to match the documented
> register layout and keep both fields correctly packed.
>
> Fixes: 5d0c3533a19f ("dmaengine: qcom: Add GPI dma driver")
> Signed-off-by: Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

> Changes in v2:
> - Updated the protocol field value properly
> - Link to v1: https://patch.msgid.link/20260720-fix_se_id_and_se_protocol_fields-v1-1-e41dbb107d97@oss.qualcomm.com
> ---
>  drivers/dma/qcom/gpi.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273af..fc12cf9122f9 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -207,8 +207,8 @@ enum CNTXT_OFFS {
>
>  /* Scratch registers */
>  #define GPII_n_CH_k_SCRATCH_0_OFFS(n, k)	(0x20060 + (0x4000 * (n)) + (0x80 * (k)))
> -#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(2, 0)
> -#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(7, 4)
> +#define GPII_n_CH_k_SCRATCH_0_SEID		GENMASK(3, 0)
> +#define GPII_n_CH_k_SCRATCH_0_PROTO		GENMASK(8, 4)
>  #define GPII_n_CH_k_SCRATCH_0_PAIR		GENMASK(20, 16)
>  #define GPII_n_CH_k_SCRATCH_0(pair, proto, seid)		\
>  			     (FIELD_PREP(GPII_n_CH_k_SCRATCH_0_PAIR, pair)	| \
>
> ---
> base-commit: 34cf6dafc47441dfb6b356a095b89c3585a93714
> change-id: 20260710-fix_se_id_and_se_protocol_fields-d7f0fe616596
>
> Best regards,
> --
> Chandana Kishori Chiluveru <chandana.chiluveru@oss.qualcomm.com>
>
