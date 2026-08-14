Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012006.outbound.protection.outlook.com [52.101.66.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABB4539CD05;
	Fri, 14 Aug 2026 21:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.66.6
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786743253; cv=fail; b=NzMcveRPISCDTxGDp9/EX9bUluDzBT8N8boqZqNz5ud9TUrnPc/S7pMYVTtCtzUrSzZy9CBOSKRZ8u8vctsxQuRImtVg7urPjcwJ5YRW1rxMR0ZezcqBDegKve9lqOQIrqaTKzE0purt1I2eGLEMXKT0OI4sHh1/HLYJlGCMFhY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786743253; c=relaxed/simple;
	bh=9A+W8fhgSfeCKf0C0kJqQF4EKgs+EOevm+D7XhLiRQU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=u8G/OexrxZXtdewAs8IgcHmGmAOIBiOdl+DHKmMy6LZqupxf999LmQwUCRLSn/pV9e0iPYNjYctpZqMxG6xb0SKJmdRKbQTDaB6C48nCAjEci60fB/zq/F3Vp4/mvGUiqywUjVFYfbRgdfPv8ibkQLs/FJBK6jh8s60Xt651vqo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=if0vJamK; arc=fail smtp.client-ip=52.101.66.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="if0vJamK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EfVV8SJQ8x53JS6W4Y+RoXhfYxKQf744S4Oiy8oKI//Y1P6NaUoyuuuQ7oBKzBz0YDRhjHmP0YZ+rY/gUgD+YU/vEbYPuUiKYQEF5PPsrloH+LiNS8pd7e+gyY2FiSDddDMMnIRnhp5IrOVdPsoFEFmPs02iE625hA9poUX6aQctnWsGBa70uTaETyS+VG70O/ZG226YjTpDzXcyobVNL6eLWSBEPkU63pA9S0sykm7dig7DO1MMlQSnGl7a6fxKGjT3EELfFylqtNMzBrNQ12uIo8Zy1cLNPE2EAwN6btAYAAkQA64gZotBAy66P9XlcFkH64XAwec/Mn94TiRKSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=srP4UbF4Ay9R4Ofx8gqf2iLWpq+/8HWUe6oQccyic6E=;
 b=k3NdLex5jwO5cmYn5a09Scmby0mW1lFJZlXZqWHI6vH8t697RRVy9OiPPj/qZvqk8GQyesRlOBvQmWQqJYR28VjqC4hsiLAtI2qS/cbmybZAN8IJvGqP7thudoL+cRaEpDiWSHDAIFQdegXa2skXkXynL4uVS7Mz9aRnzqkkOAnST+G1Uj8yrblQZLh9cYwaDwQVlfyfM2UEKs39iWpYgaVcm6tGJg+JQik4pPKf106hZXJ4ASCCiDgRI0d11ubOPFj1IGmQvtM4v0K9YJeTvpiLBvQJL0/E26PZX3N+XdhV8gKT9xQOZQmHQgo7T5oVST3o8JT3dL9fmd49s57Pbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=srP4UbF4Ay9R4Ofx8gqf2iLWpq+/8HWUe6oQccyic6E=;
 b=if0vJamK5VhjKlSI2zKP5RfyJiDKXcwCB1yeTOoXSoUh+JY+Zinf6yQV0hsl1pZ1QW1PBfsapNyMMjtfkRh+0EIHCD28YN0lzvwgy93G3cdl4qR2j2PSvjYxmk5ZrXMbTgl+yw7LtRsuxjqK6oBlvP2+dtPMm4ZGcP/3nAgk7cZ0gix8G6jfPtEnazYmOWeKRJURp88Ggx2kwTsdTP+hEzdNhESt81VEkebS6ZOKFImiiOAowdNTAN//s1FP2sSFXjZL6IgBo6Rsv0F+aBOCuU81M4bFW0+X6dy3GK6r7lk6RCoYKS+CcGoi96HSrGMr+d8t7KiKrQNL94uxurKI5g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GV4PR04MB11874.eurprd04.prod.outlook.com (2603:10a6:150:2eb::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.16; Fri, 14 Aug
 2026 21:34:08 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0315.014; Fri, 14 Aug 2026
 21:34:08 +0000
Date: Fri, 14 Aug 2026 17:33:58 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vigneshr@ti.com, vkoul@kernel.org,
	Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org,
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	r-sharma3@ti.com, gehariprasath@ti.com
Subject: Re: [PATCH v8 01/19] dmaengine: ti: k3-udma: Fix sporadic crash on
 AM62x
Message-ID: <an-JxqTbMFSOfBSv@lizhi-Precision-Tower-5810>
References: <20260810151423.1948224-1-s-adivi@ti.com>
 <20260810151423.1948224-2-s-adivi@ti.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260810151423.1948224-2-s-adivi@ti.com>
X-ClientProxiedBy: PH0PR07CA0071.namprd07.prod.outlook.com
 (2603:10b6:510:f::16) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GV4PR04MB11874:EE_
X-MS-Office365-Filtering-Correlation-Id: 87c5abd4-236c-4775-4f0d-08defa4bc59b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|19092799006|366016|4143699003|10067099003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	VcKqCkMH4bMnqHd7inQiS1Nqu0VZHfC1JQB96kltaAw8iSaIRpU3oXbonGuUcfhVZL/YttJtd1IGB+q/2pxPphFWIrOK9fq6YBVxCSn9qE8FEAIWFXClb/Tn+hsnqt6WQxhDm4ARQKg5Yc8oFiCkpF3KYJFLpzx7McdGFI0QdBMamTdidDCRPYPf+V9Y8gGSXVnBpEsreSn+Dc+s+AxBDf1qRoO2Fpgc3xeVoo8mQcdY9Ty6mju1gS92AbEcBIvQV7SGhgOGkKhxPG+ZLqIPrePzAK8U+gl0bRY8GjMb/j9CLGwb+ZBLeEShJTf5T8MI3NFe9/fgUQlIrUi2G/tOemrkZPoYMW2HhL7zFbcMpy5Z9VB0Ce0tEbVF966edSs82QD4HluI7c9qTVFRqdDKTEl5rIKZ7p7yogfeUBt5B0uqLjNqYgf4LOkolSlm5Xrj0gl1hZRJtuR4ocXMF9hOnLElBFMgPbIiGcMl+44M1PAixwJDNl9O9QsmFIxuaA8W9ms2bz8FWHxMkKK+ZVS0oiVdMrwdMQw3ndLeOrTuEMi2214//EvJd1HAmXvuUHJKXS2NokAfZY6d6oThXznYnsacl1u4oHOPJaoI/rtPHbR3wELedskG/NRmNgKvc6eoNAT6/W6VQNOOLrxSaKfH4PxDUOEv4G8/wfHq3OrzCVc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(19092799006)(366016)(4143699003)(10067099003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?FmSsBKjYXkpeumYgvZSq+aqYETuZQ1j1nbgHfYCtfCFYLzvt5xHmy16QC0Qb?=
 =?us-ascii?Q?IfpHrDYkOi3Yxck8wQa2dYqb68LUAlHtU3ubVKcVPD4rO2J/i9yC/7FO7+J9?=
 =?us-ascii?Q?xCc8mQz0xg8mZfmKKpnDMNJp7B8MKFVMbZTRAVv07ptQVFVaDA/UbNzf/3su?=
 =?us-ascii?Q?EEIM1URjv4IG8G+h9Gk7nVILHOQTCE23EI3yELFKdwI1DDXD1hC4Ocob1wvB?=
 =?us-ascii?Q?7SH3S18SOJg9i/FMFScJLrkuHCfpckuQQgMYXXx4AXXwxwl/Sw1T3cwO7EsK?=
 =?us-ascii?Q?3ZO6O8xXYObi8NssVsA7uHhEr963v2UqowVeHGwpzqgEzxz8S/XAl1fQuYNH?=
 =?us-ascii?Q?7Wq+FkmVK+5LFntzAJJhTYzY8rludlfjcb0lRER5y9gLrZ3nQ0FG/HsDE1a9?=
 =?us-ascii?Q?9FECJ5J/2hLKLFnwkzYAqb9qUplvXG1RMnfGCBtEWflrRXtPAU+I8Z1EllF+?=
 =?us-ascii?Q?xVVStK2zY31blzAGfN19HWNhsDXnyEd2JkFepqiiNsPw4JzJOHRTSlVCUIR+?=
 =?us-ascii?Q?vq9I9yacJO0qjkhhGvgTR/TDx+NDkAL5/9kdoupiI0dylY5w6KKL38M6377p?=
 =?us-ascii?Q?ys85kxLM/54Vt8oeyUxEDY40Jp/LJefkmmiS2U9L+UQAR8SWG3auSrcwdWOi?=
 =?us-ascii?Q?W2DvUrpoDLl60HhQQQktPQtJ1eAs4R3ButLdYmJtkQ6zADFBv7DENoiGvUC/?=
 =?us-ascii?Q?QSmYIsF61/Lb4iDOggIAXGLMvq2/oKf8KK6SWyDY12kTq/IJ56zvkAmzy08E?=
 =?us-ascii?Q?JM7ZPjzGOl6QSORaFL49GxaPpKNPsUDTA86RL7kqJMmcCe1HXL9L8Ct3MZ6N?=
 =?us-ascii?Q?KVfVqRZKZ6mHHmuznC9b1xlkfb3TleHuIv+jHTDMn6JCd3NxsJtaYO17r+fY?=
 =?us-ascii?Q?CE9xtd9XTaTjYt0hwpKIXSZcPT7GVgpmx3OQg8xgXZP4DCN8bOE9JZHMLk6W?=
 =?us-ascii?Q?dsGjCTxhproAbvMvHmgL8ztucsC9p1HP+zgiPKaAFllsyoOIwG97RCl+6G3C?=
 =?us-ascii?Q?mNwhjGn7NaoScig5qLgqKIHnbejRvDinFAyb5V3S/IpjKKvuiHx66NJwvLmb?=
 =?us-ascii?Q?Gcm/dpRfw/b+2Hv8ZWMs94gN5m7FnzPtt/260zGgU0pKbwAqzbopi8B9+OQw?=
 =?us-ascii?Q?oKCQdafU5DcvuNq7Mmha488/EtNOe2/FBibOI1EJ2uHWCHt64RxEVWFGUcmp?=
 =?us-ascii?Q?r0g4kr9tBbYA9cSmrhXl3pgirhVk1fwiwaSM2liJNlfhgHxHuZF/Rm+pxox+?=
 =?us-ascii?Q?vryYGJhYIltqDDR1DBqBhIFA9XOWxSLxdetxFUJZSNt+FhwvlCr5Fb2hc9YO?=
 =?us-ascii?Q?7DxVBpg9zaON6YrgcoiLSJxCGcts6qPFm10xe1/zACWCgqOYzRz+15jkqzQt?=
 =?us-ascii?Q?Z+0hrQb5qnBP/75uRlcI0IJVcgJvntWv78LyINVLhwgd9laACnysMcxUII2e?=
 =?us-ascii?Q?ea8pmpfJunJSG4OOasaKnd7bYUjynwDRxkD90tmEKhFYfcUCoKSWKy6VGOZY?=
 =?us-ascii?Q?ZRHXp5IC2WuiOlTH8g9UYqFKIfMCHeG4NMATSOZN9E2lB9aEKHjnQx9q+AQn?=
 =?us-ascii?Q?B0CPCn5CmOltQ2iGERHZDKqNCwt3TncrkxYys/p0ZpJKy3+jvE2k/u/zSDLW?=
 =?us-ascii?Q?0teOygZq9Xnt1xZHMfk0Fq5GCa6udSC2dNFZlNtpGPQ66MHQhadj/F8rnb9Y?=
 =?us-ascii?Q?2HEU8nqrPJ+n+ZnCAoi00/rOpK8NUN5WiVmrBui7xXbG9aQhcgTMng9D+j8I?=
 =?us-ascii?Q?1dW+73BS849bJ5QnK7PKdgu9WCjuWhwRZgKJowYZdOS+dGqmWn7Y?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 87c5abd4-236c-4775-4f0d-08defa4bc59b
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Aug 2026 21:34:08.0240
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3FQuJXFtkyogk+CV/1fRhxdaYaO6K9gEzBH8Cqq5OmKuY12AqcvphcOez97nBkIvh0iCbl80eWm/VZfgg1bHmHIUvDLV39iSfpmj+wdhmjh3wbssIj0OgH5ELo3i1UAc
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV4PR04MB11874

On Mon, Aug 10, 2026 at 08:43:55PM +0530, Sai Sree Kartheek Adivi wrote:
> From: Vignesh Raghavendra <vigneshr@ti.com>
>
> ring_init_data is declared on stack and thus can contain garbage which
> can lead to k3_ringacc_dmarings use junk address for ringrt base leading
> to below crash during ring pop
>
> [    1.998239] cadence-qspi fc40000.spi: couldn't determine phase-detect-selector
> [    2.532106] Unable to handle kernel paging request at virtual address ffff800081a84b98
> [    2.540051] Mem abort info:
> [...]
> [    2.629987] Workqueue: events_unbound deferred_probe_work_func
> [    2.635832] pstate: 800000c5 (Nzcv daIF -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    2.642787] pc : k3_ringacc_ring_pop+0x48/0x94
> [    2.647234] lr : udma_pop_from_ring+0x7c/0xb4
> [...]
> [    2.726250] Call trace:
> [    2.728691]  k3_ringacc_ring_pop+0x48/0x94
> [    2.732786]  udma_ring_irq_handler+0x34/0x218
> [    2.737141]  __handle_irq_event_percpu+0x60/0x14c
> [    2.741846]  handle_irq_event+0x4c/0xa8
>
> Fix this by explicitly initializing the variable to 0.
>

Fixes tag

Frank

> Signed-off-by: Vignesh Raghavendra <vigneshr@ti.com>
> ---
>  drivers/dma/ti/k3-udma.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/dma/ti/k3-udma.c b/drivers/dma/ti/k3-udma.c
> index fb21e0df5ab7b..48f4db777d924 100644
> --- a/drivers/dma/ti/k3-udma.c
> +++ b/drivers/dma/ti/k3-udma.c
> @@ -5484,7 +5484,7 @@ static int udma_probe(struct platform_device *pdev)
>  	if (ud->match_data->type == DMA_TYPE_UDMA) {
>  		ud->ringacc = of_k3_ringacc_get_by_phandle(dev->of_node, "ti,ringacc");
>  	} else {
> -		struct k3_ringacc_init_data ring_init_data;
> +		struct k3_ringacc_init_data ring_init_data = { 0 };
>
>  		ring_init_data.tisci = ud->tisci_rm.tisci;
>  		ring_init_data.tisci_dev_id = ud->tisci_rm.tisci_dev_id;
> --
> 2.54.0
>
