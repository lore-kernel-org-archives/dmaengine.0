Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010012.outbound.protection.outlook.com [52.101.69.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6494E2D12F3;
	Sat, 12 Sep 2026 02:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789181925; cv=fail; b=HxTmUflm+Xi1pViKFtHkG6vmWRHLDX0Oy7s39DiheRfk4e/b27Q80SyBpmJrXdOi9kKtkEaCIA9EiWjoUg2LKoseKDCdige0gPqXm66KKx8x0paj0IP/5y38rfUWYQxx1naOE5dhfkqmgPi5kf71Nvrg5yhKpuqFNyehL76K4VM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789181925; c=relaxed/simple;
	bh=VoW340OQHdyBxcK9Id+TCMJ/sa5nGWsEIK9OcwBAGfM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=YTYu4yMaRAFDGUPkF7ZS1s/RwgTdmq0fNQ1iOnyerFPV+Oo1WQMeMMspztndsLZRii6J4KMkD7pvblfHGkaZ63rTUfhlBXlHhhrjERQCFST7LHrPqZ3JPMpQMGCOSsQlwCNVu+Z3ChrUHFMjv4XKO7lMqve45UkCyCZOgIaM650=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CzxZ6ott; arc=fail smtp.client-ip=52.101.69.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CzxZ6ott"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AvdodCQkyniPod4niww4qk/o3mWV1JVCsom4+IPKWQLt3oF7edFKwlQJTBI5DmAsAuzyWs6L21nm0YEWM9E7OtHfREK/vRmOKq70KrWKoKUmfFG+1XppIovww95hvQtQM81nn+41X0mUWJL9SmVu6zpTht4ZDZ1CZqZg8/nvmfLogcRNRjWtIGa+LYHMegnDk3mWc3O6gBs4zEPOFAcXU+opiv1OfPXAvGFm0n1vuX6muhnfAOdo9SHhTXSWOjCUcsoQhzUGga3oN2w3fGJRMyGuWmYQqmRsyv/HUSfl3Je6ffkqBK3ulNQDUCFwHzPjy8KK1rvbFMvuBMlQusIzfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GqBEE4UAzBtQ5IU3uxpl+Ubqxjb5HWV51PNsz0S++ek=;
 b=rbbutjbglSyFV6ssageVyOn9683rXevXBE8Vg1f8qo9qajRYkXppxmXBoWn9LaxyFXZxlTT6UciZYmmWCNZGZNqIe3d80mnFZw6owEzG6ZXxjqN1p7nmPxLAXOUPLxzqC8cDN9Z5HM+GHsTajJ6fe2/jITeRXYcJFqN8rqq+NUfFeUpNACTmrf9d+6ufD5ZlwOptgsXLjEkphKjl4ptV5BkyUnzzx9nmh4llfJzLCkae9gnMmHVEHotnZBhQERx0zaYpg2UiYvzPwHefSYINOjr5UZGbu9hO/Pu1j7tnKvaUh0hDE+nfAsAF4Tw3W2gbYYuVbbrXOjxrY1howsaopw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GqBEE4UAzBtQ5IU3uxpl+Ubqxjb5HWV51PNsz0S++ek=;
 b=CzxZ6ottv44HELD6CTiMBbfFRFqkNhVTAAaG201kPnzuBxbVjmPrrdN4yrdwpt7m5fBoia1SdUOSxl34QFOXxOSlr9U1GJX6UEY/DF8CUpxb1OEl57xvLJCjTFUYYTasAXo7wBruvJE9EBySVWDPb2EdT1cd6PXOCo0qiwuUAA+i1QWMEGKpL91mEruacm5AlQfDhrQvs6wlgzzKyXnntVbA4pG3Dtk73tFCumZUXxPkdYh51NdGRWdeW4mNHBTnyJVfD3iicFer8StKVYaSQk1b10jj/Ks/U9Gun8ixKrlDlgWqwB8t2zL6q34LFenxEQzZSsiS4+4fDsYynBDj8w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB10994.eurprd04.prod.outlook.com (2603:10a6:150:224::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Sat, 12 Sep
 2026 02:58:36 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Sat, 12 Sep 2026
 02:58:36 +0000
Date: Fri, 11 Sep 2026 21:58:25 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: =?utf-8?B?5ZGo552/5ZOy?= <zhouruizhe@resnics.com>,
	Christophe JAILLET <christophe.jaillet@wanadoo.fr>,
	Christoph Hellwig <hch@infradead.org>
Cc: Vinod Koul <vkoul@kernel.org>,
	Basavaraj Natikar <Basavaraj.Natikar@amd.com>,
	Logan Gunthorpe <logang@deltatee.com>,
	Orson Zhai <orsonzhai@gmail.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Frank Li <Frank.Li@kernel.org>,
	Chunyan Zhang <zhang.lyra@gmail.com>, dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: Re: [PATCH 1/3] dmaengine: ptdma: Remove obsolete 32-bit DMA
 mask fallback
Message-ID: <aqS_0T30jKJlK9GE@SMW015318>
References: <20260903115441.912500-1-zhouruizhe@resnics.com>
 <20260903115441.912500-2-zhouruizhe@resnics.com>
 <apnJ7MtNw59x-qWh@SMW015318>
 <AEEA1wBuK97oyrSN8q4l4KpK.3.1788520536000.Hmail.zhouruizhe@resnics.com>
 <aqSCtL2kr6xczuB_@lizhi-Precision-Tower-5810>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aqSCtL2kr6xczuB_@lizhi-Precision-Tower-5810>
X-ClientProxiedBy: PH7P220CA0167.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::9) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB10994:EE_
X-MS-Office365-Filtering-Correlation-Id: fa403f18-5a6a-44b2-bf5f-08df1079bd10
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|19092799006|376014|7416014|366016|11063799006|4143699003|56012099006|5023799004|10067099003|6133799003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	rjpoiT8aaGgkwYDRsyAd/E2OSyhJ/tv4Un5D6iWWEbAXLysQtCBD2yr12KRKw4Fpqsh1Cp0aMwE8NT9ZGkHjyeXS261r8CE203GDrkf8PgomFzw52QDUbINJrL2qSYz5ai5+lZhk3grwUd54q6pMgPtSpjqGeqRiTcrErp0DLuly8vntJXLPr5Iz/Ka2zeoroLRNW+q6Px28uD6oyy6FpW3l24pE0TuzEk6Ayn7S+xGSsOIJyRtWdowZWC30vQtloXuDz0djNfY/ocEjcrVajiGFhadoohTQ/uf6QY4adRXuxdxXZlmKbx8ZIC9K3wVb53BSeziHLbFPmjnB94LiznZwWIOJfDtsAyIDKno9ZI7gAEGmcJzId/DWLydB9v8so0JpmTOU/jXsU01JRT6mJcXPNm5F4mgyL/v50UO35ziIbjokjFszeCmZyA4LM6si9Y9VuEDI8ytRaofC5Ef8H1s2bzBsln4jXYRF4XoQ9XKKlHl9Y9EedxUb0b25jNQXH0/rMH9ZIMopKirJgS0WxyG6fw23fO9RTOobF6sDjL699wflf2iSZdYm1CZ43EEpWFzCfNQFzn81edeYeId2nVIvGc2/mD9Lz76BFDfps+WZrTv6KQGJwU13AMvy0R3c
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(19092799006)(376014)(7416014)(366016)(11063799006)(4143699003)(56012099006)(5023799004)(10067099003)(6133799003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MVZkTDRFQUJrVTVVWlBZT1FsT0pvN3J2dEE1cFVXYjduTExjRkJna2VEbTh0?=
 =?utf-8?B?MU5Tb1FNQXhjZzJLM096Y2JkZjZtcm9PODlpWi9pMEhiNW4vNlpuaGJGNVVH?=
 =?utf-8?B?ZVVsSzUxUVpNeUUrdFNIN2tnTEptUmk2L0l6S2FDekxTejU4Wkx5SDhFeVJV?=
 =?utf-8?B?MG9jak9kdnk1YUtYZ0FUS09PYlh0YnE1c2ZSRWdZOGZTdkpESmxPZUNlUlpl?=
 =?utf-8?B?U2FKMVBocm5SajFWb0JqVVQzQlFvOGo2K2liZmUzOFBiNDdLbmRsd0lUVG9o?=
 =?utf-8?B?c09JMnZuUXByemYrS0htdFIvaVdRbkErM05jZjllRDJHVFRCeW9CRit2S242?=
 =?utf-8?B?YUNPK1dNK1hac2NlRnJnUkZpczlXM215cnVwek9hV25tcXNkczZYclQvNG9u?=
 =?utf-8?B?OTlJWTFKc0Vxckw1MzFBS3hWQ09NNGJNQnBjRXRUOFZFTndkOHRzOEVjclk5?=
 =?utf-8?B?NzVhRW5MVWUvYnlVeW5LZDQxZ0F1QXo5S3FwdVdZSWlrNmUxUURZaitHTkx0?=
 =?utf-8?B?YkpzUGg5cEd2VjFFcDFXcWdZYXowT0xON085dUdUcnNUOTBaNHlDQXdlRnFZ?=
 =?utf-8?B?MTZwNnU4bjcrSlR3WUlSMllPL2NQNXRzK0pkQ0Z2ZU9vU21VVUdMUkFsb2NE?=
 =?utf-8?B?QUR4c3RDbHNTVEN4QVJ5T0dWVllEZUtPUzk0alFzTklFTC82K25EREc1cjQ4?=
 =?utf-8?B?ZjV5RTNZYk1LdW81cmtJREtYTjVabDNMeERzZy84bDlFZXdhdXMwS0FLQXRl?=
 =?utf-8?B?V3VtYnZYT3FlZkFmMGJIZHh2ckczVTBld0d4R2ozMGVyMmM4TGdnb2xCZ08v?=
 =?utf-8?B?UWFwYzdEOGZZTWlPdjNKZFN6QTI0S1RmeHlhSVgycWp6bmhWMWFtbVlPM3Jo?=
 =?utf-8?B?eUFpdVhTOWhWWHJJSXk0RFhhaDJNa3NTbUJDaEZDakpLR3hKRUpRK2pzdWZQ?=
 =?utf-8?B?VFdON05jeThMNW5mWEt6TUtXak1KWTVyVXZ1WmEwc1I3dmRlTHM0RnA3NkFZ?=
 =?utf-8?B?cWtJcm1XeTQ3RXhlZnJaMjRQcTlrYmd1RXNOaUlmZkVmOHZHOFh1TmZ2amRl?=
 =?utf-8?B?ejBXN3V2SFlWWFU2N1NpU3JVNVM1R25ZUnpob1VFdXFrYlplSWFiRHkvUi9t?=
 =?utf-8?B?RGVOMlY2Rk1qTUUrM3FNdXpqOFZNVEpsWTBHbkE0aW1jWWRxb2N5SW4xRlNu?=
 =?utf-8?B?ZytDY2NBbmNQQ0p3K25yM0Q5UC9zK3dCZHR4WXByYytJZDRuSGxVcnc0bGox?=
 =?utf-8?B?WGwxY1RybWo4UzNlTTNzdjNRMmNvaTJsbm9OeGRzQ0ltR3haTnNNdCs1ZWRM?=
 =?utf-8?B?K2xqTjA2WUVzbTcvWUROY3FTM1h5bytBT2w4elRWTWVFTGVFMWNMR3ErM2Zw?=
 =?utf-8?B?TmdYTjVaWGJzREFlTE5tZ1RmQlMvcFNSSHkvbmVrQ3prd2JNNjVaVnRTZVRR?=
 =?utf-8?B?Zi8zaUlHNDlzNjIzMTF2UzkyQ3I0dWpUMi9sSVUzeEtHZUNqRStFSUp4dWZF?=
 =?utf-8?B?R2hHYUFNb1ZHTEFzcU42OGVJbk1mc2FyeXlmM2lpaXFtTzNuR29sUytwYlFG?=
 =?utf-8?B?UG1ibmFxWk9GdHlxcjV1TTBxdnFOdEZ2dXQ3cFVYNHh3d0lONkwrZldaSGl5?=
 =?utf-8?B?WGpFak1teHZRTVdtd3lYaXVvd2RsZWFsZzViTmVqUWlSM0phYlFtOEo0YmhR?=
 =?utf-8?B?eGE1U01ETWRmRXY2Smtlcnh2UGhCUFVpRW1ORDNUd2tZak5MTEdKdVh3ZFc0?=
 =?utf-8?B?aUlhQlRUV0Y5Qk9nYXJ4L1BENGRuVGpCWGVoOGR3dWpZeTlXektHeGpRSXlE?=
 =?utf-8?B?THJ0ZWJUTlhDM3U4MmZidG1SQjZLYklNK2o5TDBCd2t2MzBEd0hmell1U3d0?=
 =?utf-8?B?ZUNhcnBPL0o1dmk3MEx6UmRwZmJvcFRzaTdUci80OU9oUkNmekM5R2ZtY0lR?=
 =?utf-8?B?M1UyNWlwVFBVRHVWT3JFYjkrRHdLaVphMjVwV3NLNEFValN0Z1dLU3Bja0k3?=
 =?utf-8?B?Q2x1d2ZZMEpHS1BnWk5ucHZWZ2xhd2Z5OGI2eDZwSVB3SnZhWU0rQUxmWGtj?=
 =?utf-8?B?YWZ6eU45VUo3MWcrTzREK2YxaU42dElFMFI3ZnhjYTFOZ3RxL3Q2L1IrZG1F?=
 =?utf-8?B?MTMxNU1id1JuUWE2eHdoK05ib3h3NUNEYUc0RzFmYTdqbmNJNm9OZ0dDbkYy?=
 =?utf-8?B?OUFzVjdmay9QbVIvUHJRRkJMaElHQ1ZKZ1NBTktuWnhESzJvTDBScEdpeXcz?=
 =?utf-8?B?NFNuQ29sN3hKZm1yYTBpUldzV2J5eEUxUHZrZVhNR2FuRW5vWUIyS1kxb3ZU?=
 =?utf-8?B?aDBFdi9MVm9EdjBPZUFLNFdkY3RnYnhJdno4b01Cd3piZEtiYlIwQldmTkJJ?=
 =?utf-8?Q?UJU5jduzjF7AEpX1QC8ohF9c8nMNiSvPTLZb2?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa403f18-5a6a-44b2-bf5f-08df1079bd10
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Sep 2026 02:58:36.2086
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3ig3/+dW+uEvhxq//cgnwN3LlO58luN0oBpnZXg9HDyTF4qH/KUS6xzgy4qBH7NF0zIAGMVswa5MVUKyjSXm21zJBOuXAVwHZEl/+DhzyrY0bGhBkPvYWAEv43NDutQr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10994

On Fri, Sep 11, 2026 at 06:37:40PM -0400, Frank Li wrote:
> On Fri, Sep 04, 2026 at 07:15:36PM +0800, 周睿哲 wrote:
> > Hi Frank,
> >
> >
> > From: Frank Li <Frank.li@oss.nxp.com>
> > Date: 2026-09-04 03:26:36
> > To:  Ruizhe Zhou <zhouruizhe@resnics.com>
> > Cc:  Vinod Koul <vkoul@kernel.org>,Basavaraj Natikar <Basavaraj.Natikar@amd.com>,Logan Gunthorpe <logang@deltatee.com>,Orson Zhai <orsonzhai@gmail.com>,Baolin Wang <baolin.wang@linux.alibaba.com>,Frank Li <Frank.Li@kernel.org>,Chunyan Zhang <zhang.lyra@gmail.com>,dmaengine@vger.kernel.org,linux-kernel@vger.kernel.org
> > Subject: Re: [PATCH 1/3] dmaengine: ptdma: Remove obsolete 32-bit DMA mask fallback>On Thu, Sep 03, 2026 at 07:54:39PM +0800, Ruizhe Zhou wrote:
> > >> [You don't often get email from zhouruizhe@resnics.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> > >>
> > >> The DMA API guarantees support for masks of 32 bits or wider and
> > >> explicitly identifies retrying a 32-bit mask after a wider request as
> > >> incorrect:
> > >> https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities
> > >>
> > >> Remove the obsolete fallback while retaining the error check so that a
> > >> genuine DMA setup failure is still reported and aborts initialization.
> > >>
> > >> Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>
> > >> ---
> > >>  drivers/dma/amd/ptdma/ptdma-pci.c | 8 ++------
> > >>  1 file changed, 2 insertions(+), 6 deletions(-)
> > >>
> > >> diff --git a/drivers/dma/amd/ptdma/ptdma-pci.c b/drivers/dma/amd/ptdma/ptdma-pci.c
> > >> index 22739ff0c3c5..d36bb9c67325 100644
> > >> --- a/drivers/dma/amd/ptdma/ptdma-pci.c
> > >> +++ b/drivers/dma/amd/ptdma/ptdma-pci.c
> > >> @@ -178,12 +178,8 @@ static int pt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> > >>
> > >>         ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
> > >>         if (ret) {
> > >> -               ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> > >> -               if (ret) {
> > >> -                       dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n",
> > >> -                               ret);
> > >> -                       goto e_err;
> > >> -               }
> > >> +               dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n", ret);
> > >> +               goto e_err;
> > >
> > >also needn't check return value, it always return success if mask >= 32.
>
> Add Christophe JAILLET and Christoph Hellwig
>
> https://lore.kernel.org/all/6a4df3e0a0849f179f9747f47b9c8cae53b29b59.1641752692.git.christophe.jaillet@wanadoo.fr/
>
> Frank
>
> >
> > I did some more checking after your reply to make sure I understand
> > whether dma_set_mask_and_coherent() can actually fail for a mask wider
> > than 32 bits, and whether keeping the return-value check is necessary.
> >
> > I also read your August discussion with Michal Pecio on the same
> > question:
> >
> > https://lore.kernel.org/all/aoMty9Dvt2bnWm74@SMW015318/
> >
> > In that discussion you pointed out that dev->dma_mask should already be
> > initialized by the bus before driver probe, and asked whether there are
> > any dma_supported() implementations which can actually reject such a
> > mask.
> >
> > I agree that !dev->dma_mask does not look like an interesting failure
> > case for a normally probed device. However, after going through the
> > current dma_supported() paths and the in-tree .dma_supported callbacks,
> > I found several other cases which appear to make the stronger "cannot
> > fail for >32 bits" statement incorrect.
> >
> > The current path in kernel/dma/mapping.c is:
> >
> > static int dma_supported(struct device *dev, u64 mask)
> > {
> >         const struct dma_map_ops *ops = get_dma_ops(dev);
> >
> >         if (use_dma_iommu(dev)) {

I recall my memory. if use iommu, all mask should be supported because iova
is difference address space. iova always allocate matched device required
mask's io address space.

> >                 if (WARN_ON(ops))

This branch should be safety dead branch.

> >                         return false;
> >                 return true;
> >         }
> >
> >         if (ops) {
> >                 if (!ops->dma_supported)
> >                         return true;
> >                 return ops->dma_supported(dev, mask);
> >         }
> >
> >         return dma_direct_supported(dev, mask);
> > }
> >
> > and dma_set_mask() does:
> >
> > if (!dev->dma_mask || !dma_supported(dev, mask))
> >         return -EIO;
> >
> > For the generic direct-DMA path, the situation is clear:
> >
> > int dma_direct_supported(struct device *dev, u64 mask)
> > {
> >         ...
> >
> >         if (mask >= DMA_BIT_MASK(32))
> >                 return 1;
> >
> >         ...
> > }
> >
> > So dma_direct_supported() itself cannot reject a >=32-bit mask.
> >
> > However, this does not appear to be true for every path through
> > dma_supported().
> >
> > My audit of the relevant current callbacks looks roughly like this:
> >
> > +----------------------------+---------------------+-----------------------+
> > | Backend / callback            | >32 can fail?           | 64 can fail?                |
> > +----------------------------+---------------------+-----------------------+
> > | dma_direct_supported()        | No                          | No                          |
> > | default dma-iommu              | Yes, conflicting       | Yes, conflicting       |
> > |                                                | dma_ops state       | dma_ops state        |
> > | ibmebus_dma_supported()    | Yes, !=64 fails         | No                          |
> > | xen_grant_dma_supported()  | Yes, !=64 fails         | No                          |

This should be problem because many devices have dma_mask is 32bit.
if != 64 failure, many devices will not work.

> > | xen_swiotlb_dma_supported | Yes, threshold         | Not due to width   |
> > | ppc dma_iommu_supported()  | Yes                       | Yes, if no table        |
> > | parisc sba_dma_supported()  | Yes                         | Yes, if no IOC           |
> > | parisc ccio_supported()         | No for >=32          | No for valid dev       |
> > | alpha_pci_supported()           | Yes, threshold /     | Can fail if no             |
> > |                                                | mapping dependent   | usable DMA path|
> > | dma_dummy_supported()      | Yes, always           | Yes, always                |
> > +----------------------------+---------------------+-----------------------+
> >
> > There seem to be two separate issues here.
> >
> > First, "any mask wider than 32 bits cannot fail" has direct
> > counterexamples.
> >
> > For example, arch/powerpc/platforms/pseries/ibmebus.c contains:
> >
> > static int ibmebus_dma_supported(struct device *dev, u64 mask)
> > {
> >         return mask == DMA_BIT_MASK(64);
> > }
> >
> > and installs it in ibmebus_dma_ops.
> >
> > Therefore a call such as:
> >
> > dma_set_mask(dev, DMA_BIT_MASK(40))
> >
> > will fail even though the mask is wider than 32 bits.
> >
> > drivers/xen/grant-dma-ops.c has the same rule:
> >
> > static int xen_grant_dma_supported(struct device *dev, u64 mask)
> > {
> >         return mask == DMA_BIT_MASK(64);
> > }
> >
> > and xen_grant_dma_ops installs this as .dma_supported.
> >
> > So, for that backend as well, DMA_BIT_MASK(40), for example, is
> > rejected.
> >
> > These two cases seem to directly contradict the more general statement
> > that dma_set_mask_and_coherent() cannot fail for a mask wider than
> > 32 bits.
> >
> > There are also cases where even DMA_BIT_MASK(64) can fail.
> >
> > One example is the PowerPC legacy IOMMU backend in
> > arch/powerpc/kernel/dma-iommu.c:
> >
> > int dma_iommu_dma_supported(struct device *dev, u64 mask)
> > {
> >         struct iommu_table *tbl;
> >
> >         ...
> >
> >         tbl = get_iommu_table_base(dev);
> >
> >         if (!tbl) {
> >                 dev_err(dev,
> >                         "Warning: IOMMU dma not supported: "
> >                         "mask 0x%08llx, table unavailable\n",
> >                         mask);
> >                 return 0;
> >         }
> >
> >         if (tbl->it_offset >
> >             (mask >> tbl->it_page_shift)) {
> >                 ...
> >                 return 0;
> >         }
> >
> >         return 1;
> > }
> >
> > If get_iommu_table_base() returns NULL, the callback rejects the mask
> > regardless of whether it is 32, 40, or 64 bits.
> >
> > I understand that an unavailable IOMMU table may represent an
> > unexpected or unusable DMA configuration rather than an ordinary
> > address-width limitation, but that seems exactly like a reason for the
> > driver to retain the error check and abort probe instead of proceeding
> > as if DMA setup succeeded.
> >
> > There is a similar state-dependent failure in
> > drivers/parisc/sba_iommu.c:
> >
> > ioc = GET_IOC(dev);
> > if (!ioc)
> >         return 0;
> >
> > /*
> >  * The max IO Virt address will *always* < 30 bits.
> >  */
> > return mask >= ...;
> >
> > For a valid IOC the required address range is below 32 bits, so a
> > 64-bit mask works. But if GET_IOC(dev) fails, DMA_BIT_MASK(64) is still
> > rejected.
> >
> > The default dma-iommu path also appears to contain an intentional
> > failure condition:
> >
> > if (use_dma_iommu(dev)) {
> >         if (WARN_ON(ops))
> >                 return false;
> >         return true;
> > }
> >
> > The intended state is:
> >
> > use_dma_iommu(dev) == true
> > get_dma_ops(dev)   == NULL
> >
> > because the default IOMMU DMA implementation does not rely on a
> > dma_map_ops instance.
> >
> > However, if use_dma_iommu(dev) is true and get_dma_ops(dev) is
> > non-NULL, dma_supported() deliberately returns false, independent of
> > mask width.
> >
> > This looks particularly significant because this was explicitly
> > discussed when the default dma-iommu implementation was changed from
> > dma_ops indirect calls to direct calls.
> >
> > Christoph suggested moving the consistency check out of the fast path
> > and doing it in dma_set_mask(), "And fail the call while we're at it."
> > Leon replied that he would add it to dma_supported():
> >
> > https://lore.kernel.org/all/20240718070406.GK5630@unreal/
> >
> > The same discussion also says that the default-IOMMU state implies
> > !ops.
> >
> > So the resulting WARN_ON(ops) path appears to be an intentional reason
> > for dma_set_mask() to return an error when the DMA backend state is
> > inconsistent, including when mask == DMA_BIT_MASK(64).
> >
> > Another concrete case is dma_dummy_ops.
> >
> > kernel/dma/dummy.c has:
> >
> > static int dma_dummy_supported(struct device *hwdev, u64 mask)
> > {
> >         return 0;
> > }
> >
> > so dma_set_mask() fails for every mask, including DMA_BIT_MASK(64).
> >
> > I initially wondered whether this was only a theoretical sentinel that
> > could never be seen by a driver probe, but there is a real setup path
> > for it. acpi_dma_configure_id() does:
> >
> > if (attr == DEV_DMA_NOT_SUPPORTED) {
> >         set_dma_ops(dev, &dma_dummy_ops);
> >         return 0;
> > }
> >
> > Since this returns 0 from DMA configuration after installing
> > dma_dummy_ops, the device can continue through the driver-core setup
> > with DMA deliberately marked unsupported. If such a DMA-using driver
> > then calls dma_set_mask_and_coherent(), the return-value check is what
> > prevents it from continuing with an unusable DMA backend.
> >
> > I agree this is not representative of the normal case for a healthy
> > PCI device, but it does seem to demonstrate that a 64-bit mask is not an
> > unconditional success guarantee of the DMA API itself.
> >
> > The formal DMA API documentation also seems to reflect this. In
> > Documentation/core-api/dma-api.rst, under "DMA addressing
> > limitations", it says:
> >
> > All the below functions which set a DMA mask may fail if the
> > requested mask cannot be used with the device, or if the device is
> > not capable of doing DMA.
> >
> > and dma_set_mask_and_coherent() is documented as returning zero on
> > success and a negative error on failure.

dma_set_mask_and_coherent() actually indicate specific device's DMA address
width.

The real DMA map address need consider whole bus, for example, device
support 64bit, and parent bus may just support 32bits. DT's dma-range do
related mappings.

History reason, < 32bit, such as 16bit/24bit, some system have not low DMA
memory ragion, can't allocate memory for this DMA zone. so return failure.

I have not touch this area for the long time and need do more research to
anwser all of your questions.

Frank

> >
> > So I think there are two different statements here:
> >
> > 1. For a normally configured DMA-capable device, a 64-bit DMA mask
> >    should be supportable.
> >
> > 2. dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)) cannot return
> >    an error, so checking its return value is unnecessary.
> >
> > The first looks like the intended normal-case invariant, but I do not
> > see how the second follows given the current dma_supported() paths
> > above.
> >
> > In particular, the PowerPC IOMMU table failure, the
> > use_dma_iommu(dev) && ops consistency check, and dma_dummy_ops are all
> > paths where the mask width itself is not the problem but
> > dma_set_mask_and_coherent(..., DMA_BIT_MASK(64)) can nevertheless
> > report failure.
> >
> > That is why I currently think code like:
> >
> > ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> > if (ret)
> >         return ret;
> >
> > still has value: the check is not probing whether 64-bit DMA
> > addressing is supported versus some narrower address width. It is
> > checking whether the DMA setup as a whole succeeded before the driver
> > starts using DMA.
> >
> > Again, I do not work within the DMA subsystem, and therefore I won't exactly
> > claim myself to be an expert on this. The above are some findings after some
> > digging. So correct me if I am wrong.
> >
> > Am I missing an invariant which makes these failure paths unreachable
> > for a driver calling dma_set_mask_and_coherent()? If not, then I believe the return
> > value check is needed, and the DMA HOWTO document might need to mention that.
> >
> > Thanks,
> > Ruizhe
> >
> >
> >
> >
> > >
> > >Frank
> > >>         }
> > >>
> > >>         dev_set_drvdata(dev, pt);
> > >> --
> > >> 2.27.0
> > >>
> > >
