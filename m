Received: from DB3PR0202CU003.outbound.protection.outlook.com (mail-northeuropeazon11010023.outbound.protection.outlook.com [52.101.84.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FED649B470;
	Wed, 16 Sep 2026 15:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.84.23
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573874; cv=fail; b=JwcLuMoYLRmKd634oIKhFyzL3ZVy57NzuOK0TqncyNLF3aUNSMcOeZ4MGKirjWQTg6LO+CgdLjNrjR9ZJ5NSBOdq1j74HB2wld3lIsCst0q+w4oaVMiW4/sTCsNfG068ZZLZM3at70EboDkYDECFtPkKkRIsyRMaK4p+Ggilu7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573874; c=relaxed/simple;
	bh=19Q+xhwOEE0O/2ScIPcfpC1IeudGtVWBRrKk6hFS248=;
	h=From:Subject:Date:Message-Id:Content-Type:To:Cc:MIME-Version; b=L10aQih81kDvy8QEnDyxPTVnQhrXwDPLXNGfnPNRW5LRCfJxnorrGCHAMR1tfyYT20iP1pKDybMWSOVBuuy/IlKneF5v0l56LU8+8NKquyBQQchP75pV4UdqfZg+fDBcCny97h5jB7sdVcbt+Qhjp2SYZek+RDSCc8ENcOt9vgc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=gydhBjtL; arc=fail smtp.client-ip=52.101.84.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="gydhBjtL"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HJQOHSsODrcvoUYGnGlLl/Zk1zvNMl46EHHYHEnJyKw9mzXMiKTbjcDKgK11gq/ixixKUoNiHVIpo957GcPXKIRoJgoB7Br8YUuG/NRPYMFkl5gZ2lC9ysuQ89xpADNT8yyqlnqrqSsztJTYlL4D4sH/IDMuCEdPqQRjRFKeREsYZRdgnGuWEoEHbTDHn3vghm0XfyYhNpDhd+gj675J944uT1GfdL48AWG7dcx9NkppMmnQT+IvDCA+HO7aBmtfUNur3WwjvnG+gAvLDaYvgK1+J1vQevq4SljxP3XFYUG4xae0QJIYr1r0yJd9nbbv7+yVKVDk8cd5RuZ9/m0+OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wCbQid44keKB+D6dk13IgZTDyFwZrygI/SH6OaHsHNk=;
 b=Fk3ICkH8z1erxOpwaepy9XQ3ffqG8d08lfhGpyrdgZbJ36PMnaaoT70+Mlp1/nj3BUl1lZ63LWh8o0rN/Ixmrr1rK/G3EqN6Y73DOYaV6ji0poZo5JZlrpf66uhnQTgys9+7FAthkyIX4yAlQqd4LLUGZeivvBN8Z48PKD0p29MyYrenK29QctpZUVE4Zet5ueBG/sfrNHGVOzaOC/fH70RW2S+HWtMuZAZVwO6IFZsWDkREPzBeo4/86bpmEOsRa/1DEK1mhRG/jPUMwwySYoPIsXeFFAuc7g1PQRlU6JcDfcP9BQIpTyXfyJUoacjThu8EbNgLrydPw2OMHaHadQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wCbQid44keKB+D6dk13IgZTDyFwZrygI/SH6OaHsHNk=;
 b=gydhBjtLsIdcIs+L/ZHRAj2K60pRLawSK4nY0/rBAzDsc8wQIMgagOvKMt9i2n+zyMFiZgOLaGKbYr0tXsKKvnDwe9v37o3KcSmauLrU7rpX8pOkb2YITIROKwB4BPk5zLyUBRGAM7B5Qufpj1DOkW54a/hCmZ6nLltnUNAdD0dqlF2Wq1UDiCzrmCUQtcTsXIqfX2Dvb3kjCDsj+yGNg6Rx9p2PZaqhB5lN5gHvig+nqv0dlB2uMzoXtJDAHgGb2FWrcf924a3U2V2uvO1IKsCjjxz3Gzr+7CRDU5jG081YRHfeMPJtCsOswqnTGHkFOk0VS/GZxOPkJTUMoILSFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM8PR04MB8017.eurprd04.prod.outlook.com (2603:10a6:20b:249::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 15:51:09 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 15:51:08 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Subject: [PATCH 0/2] dmaengine: fsl-edma: add per-channel IOMMU support
Date: Wed, 16 Sep 2026 23:55:24 +0800
Message-Id: <20260916-edma-iommu-v1-0-e1731968081e@nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOy7qmoC/yXMQQ5AMBBA0avIrDVpJW1wFbFQMxhJS1pEIu6uW
 L7F/xdECkwR6uyCQAdHXnyCyjPop86PJBiToZCFkZUygtB1ghfndoHaliitVhoRUrAGGvj8Zk3
 7O+52pn57D3DfD3cAMlVuAAAA
X-Change-ID: 20260916-edma-iommu-d5b8d0b515dd
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5PR01CA0299.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::11) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM8PR04MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 1684929a-c23f-4d06-4baf-08df140a52e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|3023799007|10067099003|11063799006|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	3oEw8WQpfAR9RdC0le1PMVp6aG+G1d9UC0Lt5AIzfdiOmvfZWymarN1SR2Df1VvWSBcqxY6g2ZLnU78El2C4DbjYkER52Anva5gC9awQusY/Ce8aJyrqadYu6LvCA1JUsM4HjVlvS62pr6FMjt8yIjgDrFT80kJzdMFj4jZ5I2Twt7g2L9UOno2zBBD0uMCcmPo9HRyuwqCxSMxcO7sTZe+P1ZvRVv3uU2E/k0e62YuURMjHEYapEhK2ufk6niz9Mc1HsoEA9thfXFHYnRCQgz/v+vzqlt+b6lP0Z6NqO31bfoU3KQ1Muump4pfmy50MOw10Bj0v6P/27ZtmTmaqzF6WmNDS9uvWtSDN/w0cZofHKl2mGatF1Tt5DMnrsHIeWBsxsHMEhZHkJmO3ArM0OfDydkKdwTx8Hyq6KBS54HaI+uSp+zPQnWRQEjG6mXCKVvtSTkewXXoT8LqkxUOvzveg3AcqdyA4ARF59O+rt0D3ARfZv3ads4tDhMBwMAeSPMk9OpMJGyA2H+1deu6Bfb8Vm3zR/qjCCUpn8IIxYSb6YrgK0O3vs3XAAXjzwyF2PcVr7pDJS/GWoRasDFGZRFzvLq3MtQ/vUwZcpoGIc+jShLve2EHww4sVyTi/AOxM
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(3023799007)(10067099003)(11063799006)(56012099006)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a0VRL3B2ZlVjaDJaTlYzVm9mTjBTaVh2Z2pwd0oxaGlGZnlCRS9HbmtXQTZs?=
 =?utf-8?B?S1B3NEs0b1ZkdXh1aEo5djUrSzE2ZGlNbzNVVXEvS1ZFYUxyUGhhZWtRZWxE?=
 =?utf-8?B?MTFkQURLTHl0K3pyaC91bGVoUVNYWTY2T3JBaEtpTXdHZ2lDeFFHN2dnWFh6?=
 =?utf-8?B?aGZXK0hpOU1kcWJObnhRVFloVHdKL0hIOWF3MUtHZXR6UkRST1RwZ0N2d0V4?=
 =?utf-8?B?M0owVzUzdXhCODBlZEJzcFIydU1kY2t4MXdtODVRVVIwUDhpL2FLOGJrdzdj?=
 =?utf-8?B?dENpUTc5VGNIUjBhc0VZQlc5Vkg0SkkwMG9TeWU2MTVEbGRhVHg5UEgyM2x5?=
 =?utf-8?B?aW9CcDhIVzZvUFBFbGIyYmRWanZwcHk1NUNkQ0NYeGpRM0RGMjRQOWp3MmZO?=
 =?utf-8?B?bVdScDZseTV5OFoyaXlsZGozb1JIaUtmS3VyUmpTeUtZSlR3dW81UjlRZW55?=
 =?utf-8?B?MjlGaTJDVkhqV3gyNFcveElJZ1FTMTJNaDJla2VUS3l3QkJxY3RBU1pOMGgw?=
 =?utf-8?B?NitwWlBVOEJXZnoxbFlDWWpJanFSUVh0YWg2VWtGamIyekRDVXRYeklsRHFp?=
 =?utf-8?B?RWxnMDB4eWU0VWxVdmwzWTJsTWVGaVFwSGhvZ1FRUGdGbi9Qa21mUE9sWUJ2?=
 =?utf-8?B?QlQzUmxIR1k1Wmt3dWpJVW93elpVUG5KYTNRblhZWEQxWVJBVUlYdVBBdUdJ?=
 =?utf-8?B?ajEvTFJNWDVCRjliMy8rdVVSWHpNSVFQelBaaE9jczEyQ0Y4aXo3WnJnL3Mx?=
 =?utf-8?B?bkhObjhwUlJTZjl4bWJRdmkyMktZa3Nia09GR2pUbE1kUE52NEljOFNKamxL?=
 =?utf-8?B?MlJwR2h4LzRMYU1FTlM0blhpeVVrUFYrdDQ1OFc2cTBEcStVNm5xd2h0Tjl5?=
 =?utf-8?B?ZTc3VXp1V3NSVkdEYVNvQWhBYlErV2F0QWdsRThmdzR1SHlnY3hzTUMvc3Z0?=
 =?utf-8?B?ZWl6WjFDdWdzcUtXQ3hiM3VLcWp6cC8xeGN1MVA5c08zdVJFSVFISEZSNHFX?=
 =?utf-8?B?Z0laL2JsVS9VcTlldXdRbzkwa2RPUVBmNXpLNk5tYUY3SkpacS8vWjRUNlpx?=
 =?utf-8?B?a2N0QzFhMmFaNVM2ek9CS3dPR1UvTzRTeGl2MHg4OTZGa1E3NW9iZjZseHBv?=
 =?utf-8?B?UWNXelRMNUdUOElnY2NYUVRpTFhmS0tkYzUvMVdUSVFVNC9tTE1lQTduRkVS?=
 =?utf-8?B?UjhBbzJ6YS9WVGp3SVliL3l5eWYzOVJnUVJPUE8yekVLbnJGRDNhdjRtOTg5?=
 =?utf-8?B?WmlUZ0c1Znc2TjJxeGRXL2xVamg5cHBtci96UENVcnkxWGQ4enF6RCtYcThZ?=
 =?utf-8?B?bjlOVGNTRCsxaDFEbEpBNERjNHR1N01WWVlrSGJHRjI0S0J0RFN5cFg0Qlp5?=
 =?utf-8?B?bmxIY3RyN2FQU1RncGJkK202ak5XcnJ0K2JBYjVNVlVUOUo5ZVdiV1FvajVC?=
 =?utf-8?B?b1M5SHcrL3YyTkh3MldjajNOaGlqRnFXUzZ6dS9YbzdkeXRjOXpVU0Y4UjRU?=
 =?utf-8?B?Z2VCZVlyS2ZsaW53ODBaNmh5L3ZYOCtoYk9XaThTdU8vbFNEU0lkczNoUG5M?=
 =?utf-8?B?NTNyWHJYLzlnUVMyMkFpeXVtMVQ2ZEg4cVhMN2tJa0FkbjI2cjh4Ym9jT2RT?=
 =?utf-8?B?WG5TN3g2bWNMdm5qdzJ1a0hyaWlOZGtiUHJ0NkR0MEg1MElZK3crL08xUk5v?=
 =?utf-8?B?VDZ0VlZvb09ZTlJOK1ZmdWZxL29pWXF1aTE3SWZvQm9xTm9hdjY2M2hPRUwy?=
 =?utf-8?B?T2liaWlJL2ROeE9NRmVDVGZna3lkdGIzSFhZQk5xV1VZWUlNSGdEcTh4amFV?=
 =?utf-8?B?QXY0Zm10eTNhK052WFR6YzRIUE44T01oM2pEN2V4RVo5V3g1Y2xDV1h6Uk9I?=
 =?utf-8?B?UWppYTNYeUxNRlpUZzJLZ3FJVUdSbjZYZkY1dFdxOUJ4a2tNWXhrTTJWbjJ5?=
 =?utf-8?B?V28ra1ZjWEJjQWdDbWhFYWU3dlY2Z1FJWHlWOGljMTVORDZaN0MwVGhsM3lh?=
 =?utf-8?B?ZHZtcklwUmpZWGplSVdKZ1ZGQ0tWaHAvbDlyU3JQU2hUbUFCM2ZRVlRiN0tQ?=
 =?utf-8?B?OE01M3BqNk9kUlNqVXVGT2w0VDJIWk1icFJXQVBDeEhKZWZNMUFJZkVUUFg1?=
 =?utf-8?B?N3lRYnV3UzJCcGx6SHZSNEc1MUpXbTNVU1JwR2FlWS96QURYVk5oeGNBelhF?=
 =?utf-8?B?dGF4M05YZTcxcWlHQ2pqVEVpOG1Vd1lGemcxWXI1aU9nRnZOV2ZJNEhhdnBw?=
 =?utf-8?B?MGxVa1oxSFJDMmhXY3Ftcm96bDg4VUZ0UStPR2llNGE1NnFpVDB2THFZMmVQ?=
 =?utf-8?B?YTRvd1hvM29ENDRSazJ2eXJLS2tzekxlcUxvN29TV3M0T1ZTcmZzeXY2alVQ?=
 =?utf-8?Q?iNtq/4lWJiLRI4TWa0SV5+4v2X3H1memtPAWA?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1684929a-c23f-4d06-4baf-08df140a52e3
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:51:08.4201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5EETqDRPfMFmQAfz4yH+6VS3z9xwjNSdQh+1CDObU6+TDrRDca+enGANkblVpyr/DvEVfidNLqYDz3JvWEr9zfiWUQJK+kq7QK0aa4FEF3FChOf0NmDc2m28S+dg3XYV
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8017

Add iommu-map support to the fsl-edma driver to enable per-channel IOMMU
stream ID mapping for eDMA controllers.

On i.MX95, eDMA channels are assigned individual stream IDs by the
SMMU, with paired channels (e.g. TX/RX) sharing the same SID. The
standard iommu-map devicetree property is used to describe this
mapping, following the same pattern used by PCI controllers.

Patch 1 adds the iommu-map property to the fsl,edma dt-binding schema
and includes an fsl,imx95-edma5 example demonstrating per-channel
mappings.

Patch 2 implements the driver support: at probe time, per-channel
devices are prepared with DMA masks and bus pointers; at xlate time,
the channel index is looked up in iommu-map to attach the appropriate
IOMMU domain. Channels without a matching entry operate in bypass
mode.

To test this patch on i.MX95 for channels using shared SID, needs:
https://lore.kernel.org/linux-iommu/20260916-smmu-shared-sid-v1-0-517384504aee@nxp.com/T/#t

If only test channels that not needs shared SID, no need above patchset.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Peng Fan (2):
      dt-bindings: dma: fsl,edma: add iommu-map property
      dmaengine: fsl-edma: add per-channel IOMMU support via iommu-map

 .../devicetree/bindings/dma/fsl,edma.yaml          | 89 ++++++++++++++++++++++
 drivers/dma/fsl-edma-common.c                      |  6 +-
 drivers/dma/fsl-edma-common.h                      |  1 +
 drivers/dma/fsl-edma-main.c                        | 76 +++++++++++++++++-
 4 files changed, 169 insertions(+), 3 deletions(-)
---
base-commit: e6e35979777d646fe3c7c94dca7dd32fb25d45f4
change-id: 20260916-edma-iommu-d5b8d0b515dd

Best regards,
--  
Peng Fan <peng.fan@nxp.com>

