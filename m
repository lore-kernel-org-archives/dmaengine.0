Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013037.outbound.protection.outlook.com [40.107.162.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1493F4D6C4F;
	Wed, 16 Sep 2026 15:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.37
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789573887; cv=fail; b=YyBG2sv4oAgjxix6OPae1Fn/fnqQR5E7coOVcUmqmO06cnSgLNZxCMM6rnDoK+lHsiqeIcI8wtaNinE86XQOxiWnLW8GjTSr+UmP1R5f/Zk1jf3aHhefWB/2nH6FZ1OP1T+TjHrIuz3sX4Z2/G6ngwDkc2wfI+m7p+M8FXsPgVo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789573887; c=relaxed/simple;
	bh=oHPuP9FKtRu1UWoALp8bNL4vsle287FSUr+VXEwLVAk=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=QfUcMojFKAHWGe6V3CX5JoiymdmOb/eh4we7Tv7V3I0pWML2FfnBAfYm3HKuKc2S0VLBKCj228MzMbXDAicfAYWPYDbRHnHYDTVHJrB0FTFSz+ToeptYF2GNk3W5Mt/dkfCc6xw7PzuThZ5HtZNPl8evYLjARW3iAD+eoc4CXo8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=x+/SN8VY; arc=fail smtp.client-ip=40.107.162.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="x+/SN8VY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Lql2YEvADJC3HueAWPphM8Fqa0Kn5aLp8fRs3CMpMOaFb/n0MgnUf+tmCAreakPcsOjkS2VFgN7ibDKhdyS1CXGto3PJKbbG9wqYNowTa6UtlDT7WctfSCSi+eCe7YCMmyORs6AeIbV8akdhZFbxfRN1xGtqpStD5t+LUFpxFLpCWqmpGPVBv+yVaNxIgGtu3E9bydDx3whkIH3w+1AWOoZ3j0viit4JjbM8KN+gj4d16t1KiSfUqNrLEujd8Phk1/Ftu0uTwfWVdWnPvrYrUUoMFo+FFNDJaqnUrZLG5QpKmcwuROyOLWbOfsEF99itoAL+74REO5O+3daLteIKwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mBjc7c5IdB0az762XYt1InKlM2MgLuDjPHvAUHTYu6U=;
 b=ccfE/XhT2VTIgsvg+BwpdScKjORt6nJg5GNv8WUKhAJNXUGPschX1vM2kiBr2rr1E1Eg5PHATRd6CZSi1ueJSXnU8PEtrwzE6BPnClmvBEFqwGxFQbeOhIS8CtxLnjZ4gXJnLtStZcAeoZtXXqVSdC00KA6G756I8AYzIRxqeW1DTl1HMt7L/Pk3Bk4Xi9N8hCa/e9DHaee+8UZsqSgzvrHUMdltew+7lCA6O0e9G2ebqAZyYf7vE90UeqR4FLm+i5tmhsXK3iFSw4xJY76F/N6t2nXvelRsfBVz+avewZmKXNYE/vqObrPina71icVdf/I0tKHal02rjDvoC5OtyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mBjc7c5IdB0az762XYt1InKlM2MgLuDjPHvAUHTYu6U=;
 b=x+/SN8VYwL0m8Pdk0dpjNFbeMbACj/63qB7oONZrQrvxBgiglUQfY19qYH18E/qlrBBp3HtDUwB1h0kpRf+juPi+mzKWEzDKcVKaGidy3c7IeZCR9nTe1Gpn/EPEUgqI2Z8tbGRr/dDTFa3KdPChLMbAbv/eZDN0gzURJLdfH52qMDQsp5olt53Sg7M/sRyMRgzzepN8RoBN1blewdzgUqZv3QE3gw2Z55hfbtT3pTBShZ5ZqJQ6hTyD3b3U0FY9BVhcaHWBi0LwA2n9yloJiWPpvbrjadtDWtHy1yf9IVOqOL3QLPbkPfqenBxKZ1R6Rh74k6qYUVC3gJCwaS9i1A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com (2603:10a6:20b:24d::9)
 by AM8PR04MB8017.eurprd04.prod.outlook.com (2603:10a6:20b:249::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Wed, 16 Sep
 2026 15:51:21 +0000
Received: from AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9]) by AM8PR04MB7874.eurprd04.prod.outlook.com
 ([fe80::ac38:1699:6f18:c5d9%6]) with mapi id 15.21.0428.009; Wed, 16 Sep 2026
 15:51:21 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 16 Sep 2026 23:55:26 +0800
Subject: [PATCH 2/2] dmaengine: fsl-edma: add per-channel IOMMU support via
 iommu-map
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-edma-iommu-v1-2-e1731968081e@nxp.com>
References: <20260916-edma-iommu-v1-0-e1731968081e@nxp.com>
In-Reply-To: <20260916-edma-iommu-v1-0-e1731968081e@nxp.com>
To: Frank Li <Frank.Li@nxp.com>, Vinod Koul <vkoul@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Frank Li <Frank.Li@kernel.org>, imx@lists.linux.dev, 
 dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.16-dev-7bc12
X-ClientProxiedBy: MA5PR01CA0226.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1f3::12) To AM8PR04MB7874.eurprd04.prod.outlook.com
 (2603:10a6:20b:24d::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM8PR04MB7874:EE_|AM8PR04MB8017:EE_
X-MS-Office365-Filtering-Correlation-Id: 477fd27c-e638-40c8-be13-08df140a5a92
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|23010399003|376014|19092799006|1800799024|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	NdULoHvn8d4wFiQvbXn4/cz9dIc5CY14hKk4l/+s1yDGwVOuK73cbONJAWFb5l6aEqhmo+nV9wTdpw5BbqM8jKS4y6tX8dwRg25Rq/AyrhI0+28LXElO8FGKvt6uGvdx5FhVLROuSBjye5mS76biwKzlBp5i43I4iWtGGp/mUmmKaRLqdtv46vjTNl8722sq4bEdIBztgHEsh1bLK68xNASy6cAtDmqxDv583zQF/Gj/X/eIre4l7zLyLGPjSxvTGNPu+0VVo2qA4NKLY8r46Y3wznKDVwpAY17MOTSGcOy+4Y0CXASAwfNc6OJGwZRkjjrAgVUSDFcWefkF0SxUfKkJiPO9P2d68A0SVgeavtclwuc9qUskw/XpU4NX4sjCKK3PXIhbw1mVp43HeWgQQUKsN77wzHYL4IwVwVnZlYNL/6od354PniPLtyou3qNN+VU/1Js61TIKFts663cDcfJ6tfWS/ElabwFLZEsEgLxjNmX0ZsZOM+xDoFQjmYrBOW/yvpZCQZQkiBCo2SZ/3RLWQsIDg47QUaWVIoTIYBlj9vP1Cp25ylJVlGzYkKWMOb/mIYBMJ6TRWO65e5li7OOql3sGsfkwAqQDno2n/lXdQd5fdG88AXcBd9946T35/4Bp3nmB7I4RZGQ/p5B7Ugy7Ajtm52ne1w89tk4khUI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM8PR04MB7874.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(376014)(19092799006)(1800799024)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MDcwbmYrZ01QVm5vV1NzYUF5VlpGbnBBT3VuNms0aXpoNHFaL1QzVU5pS2NC?=
 =?utf-8?B?UDNGcVNoK3dMRzNucE9STjJlb0ZqbnRPVTMxVlo5enVYNGkxN2p5U3BiOXZl?=
 =?utf-8?B?UHJpKys3WlBDZlJyUFBmMVNndzFpNUJGWmpsdGdpeUY0MWRXOVRPM1lqeTQw?=
 =?utf-8?B?YStDU0JyOUxJcElPenFuWCtGRW0xYmM0WmlQOXhteTg2YlpPNU1ic1A3QmZk?=
 =?utf-8?B?a1Y4OThtKzVWMTdiNk5hZng5OWRKWEJ2dk95RjBVdzRZV2l4eXI3aDdQcnk0?=
 =?utf-8?B?TXQyalgzTXpzVi9HMWltN3VpS2llWkVucGFPL05MaVVsRHQzSTBNakk2Qk8z?=
 =?utf-8?B?RmN4QWRnbnU0SVB3VFVRcVhzaHNJTXdkV0dYZUZaZnIyV1NsclA2Wk9EZmJp?=
 =?utf-8?B?NENVcVFCSWljTFZ5aHFqY1l0L2czMHppS1hsK0h4ZW4xWWdFR0Exc05jRU1L?=
 =?utf-8?B?Y21Tb0ZGdFdxYVc1Q1QvMU8yVnZIYzdsL0RyVVNXVmxBdDg4S0FvVmNhVndS?=
 =?utf-8?B?MC9OTjRHS01CajYwdG9PQjV4anUrUEZYSEtpTzhCQjRpekR4aWcwNFM5dE1G?=
 =?utf-8?B?WTMwbFF6cHR3dEVnYXVuUkZKeGR0Um5xUHVDVk9Zc2ZsVmZBaCsrOC85alVN?=
 =?utf-8?B?MHZHbVY1NzZuQXE5VDhRZzU3UVhIY0x0bHRqNmNSd2V6d0JRbW9wMDRKc0Nt?=
 =?utf-8?B?bEdWV1pxc3F6MzZjWHFMRGNUYXJZZGZoVmdtUjZFMVByWW9vQ0VLNThrQXJu?=
 =?utf-8?B?LzhtQVh6TFhPTWdTYVdLanY1ckkwZEZUYW56bFEwU2JXWEZhaG9ieHcva1VX?=
 =?utf-8?B?UDBPR3g0VFVTbjlJZUdDTmRzNHhqVWhjVTZsb0pJY0ZEeUFVbnBlRytSUlVw?=
 =?utf-8?B?Nk5kQVhLeTlxVkRvbm0yOXRsVnpOb04wU1Npc1hqS1lZYUhkc3FnN3JqZFoz?=
 =?utf-8?B?ZDNVdmFBb2grREZKM09yUDRpbnlHemZNVEhuV1J0RGVsTVo0ZllrRmxJOE9s?=
 =?utf-8?B?eWZpaVMrd3FRWEF2VkVjS0Y0c0w4STZuQnVwVUdoeFAxK3ZDTWRRZ2hKS2Ix?=
 =?utf-8?B?WG9DWmxjUXgvMnEwcmZuUWhvcjZ4dmdvdnVjNHBON25QV0t0amRWeDdFSUpz?=
 =?utf-8?B?MlpwWHJ0Mk1LdkZ6NUNhUFphcVIvbHdFT216azFlWTZ4Y2JCLzhxQWVHVlho?=
 =?utf-8?B?MmNzV21ZeUNQbDJORGZnMnJ5VFZ0Wm1XRlhnVHpWeW0wNFNBRzVTcFNDaEI1?=
 =?utf-8?B?UHBCNVd3ZU1GMWVvZzNQNjY2NHViNHhzSVRUWFVRelpvNWFhZDJOekh1QlJQ?=
 =?utf-8?B?dWd6MVl6czdTOGFGd2l5UDhZdmR0QlNQVWlZSmdoNEVCQ1cvc2tSOTVTWHZD?=
 =?utf-8?B?OWdFb1plM25UOGV5eWJ0bVFLR04wcHVGN1hxSy9wNm9pajV6NVp6SVphWVdT?=
 =?utf-8?B?T1RiRUF3bGZ1ODVOdnNrZmRlVllOcVY5S2VpdVlGc3NFVDdzcm5tQnZCK29R?=
 =?utf-8?B?eDZKMitPYUYramlielhJL01pY0EwZXZZT2ozQ3o2djg3eSs4bkh5Qm13WU1h?=
 =?utf-8?B?SDhUOWpwdFpRaTd2VlVBRGFDVGhRYkV3V2hiQ1d5ajJiaW8zN2llU3BKK2hk?=
 =?utf-8?B?SzBXKzZpQVM3eVR2OWdpdUhXeWVXR1BkMldHRUIyb0VXOGdQbUJDbUo3VFlH?=
 =?utf-8?B?NGw1S2JNYnN0VU56UktKelZKNGxncnBBMkpDRHZXb2tMckxBTnBTNnExK3g0?=
 =?utf-8?B?Z051UUlyemJNQldiMCtFTmVkVDRzSjJvR1BVMnVMdlZZR1VSMHc5UHdkdUZF?=
 =?utf-8?B?KzN3eGN6UmsxVkY1Yi9haktjS1FUa0g1WGx2a290UnB6aGE5Q0J2VXN5Q0Zl?=
 =?utf-8?B?eGpVRnNxbmVCc0hic2NzVTJPTExSNmNMQi9PQWMvdnJhaFVkK3c3dmRyYUdU?=
 =?utf-8?B?YVUxYlJNV21vaHo1R29RT1EyTHdsM2I0cnRMaWQrNDkyWXd5T2RTMm80cVE2?=
 =?utf-8?B?ZENpKzkvWDluZmQyVGlTbnlPazA0a3V4K0xPNWFkNW9BcHRRTnI5dGgxNU5a?=
 =?utf-8?B?NFJmMjllc2FuZUV1UFJoQnhsNnFERXBEdDcybWZpdXo1YmUxa1YyZWxsSlVK?=
 =?utf-8?B?Tk03b3loalRYV3pjS1plb1pkdzYrWFlXQUh4YWdtUmhPREl6NjlSZWwyY1VW?=
 =?utf-8?B?MHdEdzFGZVdRSkloSmp4dkNDa0J0NmRwc1lRcGNJaFI1MlgwSlZDcnJLZGFa?=
 =?utf-8?B?bk1LNC9IUlppWjZSTFFKSlpRQWNNMGtJWGhrTnZVY2M3b010amY2WVZ1eFE1?=
 =?utf-8?B?eW1mbi95K2kxSTJHdk0zV2t4K0tKN0VSejUwWGgvQkJGWjFvdFp3UDZiVDNY?=
 =?utf-8?Q?VrwjFcCP39+OdBJBQEnyLe92LU2+2RafcPDXY?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 477fd27c-e638-40c8-be13-08df140a5a92
X-MS-Exchange-CrossTenant-AuthSource: AM8PR04MB7874.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2026 15:51:21.2782
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E2t8sFsGmTfzwVxYcYMTnYp88udUOwIAJ3B5Cc5qUQbVtyWQkr2aNo8wRhlWAzYjOOKJ6IEL+17fle1sqlZYeLYJHP2l4XCwDlghPYAh5XJDlDzmUivGZbNk1JEq9WhL
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB8017

From: Peng Fan <peng.fan@nxp.com>

Add iommu-map support so that each eDMA channel can be individually
mapped to an IOMMU stream ID.

At probe time, fsl_edma_init_chan_iommu() prepares per-channel devices
by initializing DMA masks and bus pointers so of_dma_configure_id()
can be called later.

At xlate time, fsl_edma_chan_configure_iommu() looks up the allocated
channel index in iommu-map. If an entry exists, it calls
of_dma_configure_id() to attach the IOMMU domain and sets chan_dma_dev
so dmaengine_get_dma_device() returns the per-channel device.
Channels without a matching entry operate in bypass mode.

Also switch fsl_edma_prep_slave_dma() and fsl_edma_unprep_slave_dma()
to use dmaengine_get_dma_device() for DMA resource mapping.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/dma/fsl-edma-common.c |  6 ++--
 drivers/dma/fsl-edma-common.h |  1 +
 drivers/dma/fsl-edma-main.c   | 76 ++++++++++++++++++++++++++++++++++++++++++-
 3 files changed, 80 insertions(+), 3 deletions(-)

diff --git a/drivers/dma/fsl-edma-common.c b/drivers/dma/fsl-edma-common.c
index bb7531c456dfa..58a92ff4ddbe7 100644
--- a/drivers/dma/fsl-edma-common.c
+++ b/drivers/dma/fsl-edma-common.c
@@ -283,8 +283,10 @@ int fsl_edma_resume(struct dma_chan *chan)
 
 static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
 {
+	struct device *dev = dmaengine_get_dma_device(&fsl_chan->vchan.chan);
+
 	if (fsl_chan->dma_dir != DMA_NONE)
-		dma_unmap_resource(fsl_chan->vchan.chan.device->dev,
+		dma_unmap_resource(dev,
 				   fsl_chan->dma_dev_addr,
 				   fsl_chan->dma_dev_size,
 				   fsl_chan->dma_dir, 0);
@@ -294,7 +296,7 @@ static void fsl_edma_unprep_slave_dma(struct fsl_edma_chan *fsl_chan)
 static bool fsl_edma_prep_slave_dma(struct fsl_edma_chan *fsl_chan,
 				    enum dma_transfer_direction dir)
 {
-	struct device *dev = fsl_chan->vchan.chan.device->dev;
+	struct device *dev = dmaengine_get_dma_device(&fsl_chan->vchan.chan);
 	enum dma_data_direction dma_dir;
 	phys_addr_t addr = 0;
 	u32 size = 0;
diff --git a/drivers/dma/fsl-edma-common.h b/drivers/dma/fsl-edma-common.h
index 205a964890948..85487763e05ab 100644
--- a/drivers/dma/fsl-edma-common.h
+++ b/drivers/dma/fsl-edma-common.h
@@ -264,6 +264,7 @@ struct fsl_edma_engine {
 	int			txirq_16_31;
 	int			errirq;
 	bool			big_endian;
+	bool			has_iommu_map;
 	struct edma_regs	regs;
 	u64			chan_masked;
 	struct fsl_edma_chan	chans[] __counted_by(n_chans);
diff --git a/drivers/dma/fsl-edma-main.c b/drivers/dma/fsl-edma-main.c
index d9fb717b5b53c..eabb0086fc9de 100644
--- a/drivers/dma/fsl-edma-main.c
+++ b/drivers/dma/fsl-edma-main.c
@@ -16,6 +16,7 @@
 #include <linux/interrupt.h>
 #include <linux/clk.h>
 #include <linux/of.h>
+#include <linux/of_device.h>
 #include <linux/of_dma.h>
 #include <linux/dma-mapping.h>
 #include <linux/pm_runtime.h>
@@ -24,6 +25,7 @@
 
 #include "fsl-edma-common.h"
 
+static int fsl_edma_chan_configure_iommu(struct fsl_edma_chan *fsl_chan);
 static void fsl_edma_synchronize(struct dma_chan *chan)
 {
 	struct fsl_edma_chan *fsl_chan = to_fsl_edma_chan(chan);
@@ -298,7 +300,7 @@ static struct dma_chan *fsl_edma3_xlate(struct of_phandle_args *dma_spec,
 	struct dma_chan *chan, *_chan;
 	struct fsl_edma_chan *fsl_chan;
 	bool b_chmux;
-	int i;
+	int i, ret;
 
 	if (dma_spec->args_count != 3)
 		return NULL;
@@ -332,6 +334,12 @@ static struct dma_chan *fsl_edma3_xlate(struct of_phandle_args *dma_spec,
 		fsl_chan->is_remote = dma_spec->args[2] & FSL_EDMA_REMOTE;
 		fsl_chan->is_multi_fifo = dma_spec->args[2] & FSL_EDMA_MULTI_FIFO;
 
+		if (fsl_edma->has_iommu_map) {
+			ret = fsl_edma_chan_configure_iommu(fsl_chan);
+			if (ret)
+				return NULL;
+		}
+
 		chan = dma_get_slave_channel(chan);
 		chan->device->privatecnt++;
 		return chan;
@@ -695,6 +703,70 @@ static int fsl_edma3_attach_pd(struct platform_device *pdev, struct fsl_edma_eng
 	return -EINVAL;
 }
 
+/**
+ * fsl_edma_init_chan_iommu - prepare per-channel devices for IOMMU
+ * @pdev: the eDMA platform device
+ * @fsl_edma: the eDMA engine instance
+ *
+ * Must be called after dmaenginem_async_device_register() so that each
+ * channel's chan->dev->device is already registered.
+ *
+ * Initialize DMA mask and bus on each channel device so that
+ * of_dma_configure_id() can be called later at xlate time.
+ */
+static void fsl_edma_init_chan_iommu(struct platform_device *pdev,
+				    struct fsl_edma_engine *fsl_edma)
+{
+	int i;
+
+	if (!of_property_present(pdev->dev.of_node, "iommu-map"))
+		return;
+
+	for (i = 0; i < fsl_edma->n_chans; i++) {
+		struct fsl_edma_chan *fsl_chan = &fsl_edma->chans[i];
+		struct device *dev;
+
+		if (fsl_edma->chan_masked & BIT(i))
+			continue;
+
+		dev = &fsl_chan->vchan.chan.dev->device;
+		dev->coherent_dma_mask = pdev->dev.coherent_dma_mask;
+		dev->dma_mask = &dev->coherent_dma_mask;
+		dev->bus = pdev->dev.bus;
+	}
+
+	fsl_edma->has_iommu_map = true;
+}
+
+static int fsl_edma_chan_configure_iommu(struct fsl_edma_chan *fsl_chan)
+{
+	struct device *dev = &fsl_chan->vchan.chan.dev->device;
+	struct device_node *np = fsl_chan->edma->dma_dev.dev->of_node;
+	struct of_phandle_args iommu_spec = {};
+	u32 chan_id = fsl_chan - fsl_chan->edma->chans;
+	int ret;
+
+	if (fsl_chan->vchan.chan.dev->chan_dma_dev)
+		return 0;
+
+	ret = of_map_iommu_id(np, chan_id, &iommu_spec);
+	if (ret || !iommu_spec.np)
+		return 0;
+	of_node_put(iommu_spec.np);
+
+	ret = of_dma_configure_id(dev, np, true, &chan_id);
+	if (ret) {
+		dev_err(dev, "DMA configure failed for ch%u: %d\n",
+			chan_id, ret);
+		return ret;
+	}
+
+	fsl_chan->vchan.chan.dev->chan_dma_dev = true;
+	dev_dbg(dev, "ch%u: IOMMU domain configured\n", chan_id);
+
+	return 0;
+}
+
 static int fsl_edma_probe(struct platform_device *pdev)
 {
 	struct device_node *np = pdev->dev.of_node;
@@ -882,6 +954,8 @@ static int fsl_edma_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, ret,
 				     "Can't register Freescale eDMA engine.\n");
 
+	fsl_edma_init_chan_iommu(pdev, fsl_edma);
+
 	ret = devm_of_dma_controller_register(&pdev->dev, np,
 			drvdata->dmamuxs ? fsl_edma_xlate : fsl_edma3_xlate,
 			fsl_edma);

-- 
2.34.1

