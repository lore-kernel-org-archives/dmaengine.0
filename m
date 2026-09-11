Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013020.outbound.protection.outlook.com [40.107.162.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 621D53C585E;
	Fri, 11 Sep 2026 22:37:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789166274; cv=fail; b=rwQ5Jy5GE1JfHzOih/JYwFTuBtaERJLU+huD/nMmR7t3ssKU8ySddmtrg+qvkmKcsAYrRNW5Ilt+KXqSdzNlQXx8ZTfkYAxvD3XdX9ZwSbtKHsUIYjMb1yEukS4iHcBUVDnJ1glkrLDhK1GY7+ZqD6QYYR2FCippobgg3jRSz5E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789166274; c=relaxed/simple;
	bh=cffF399sni+pmQixjne6NFj8lsAEHyg1SBaeLLlrWz8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GPOk+mJvl5LHevVzH0PvQa1BYZ5EHqea5xAYsj/DEPY8iRaD8s3GB6nzLqNf9w3yCFYwvHP2irw4MMirbKwgMvfNcnMXkSyBu+IOGTEeO0qy/ICWRUPU7EN3j9PiBO+lzRB/AUNCEBEXKB8qLjTAKHNDk8hQ8t3en/KXt5QverI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=vsDTfBIm; arc=fail smtp.client-ip=40.107.162.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="vsDTfBIm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nanxP6iMe4O8o4c7xp3uZJGOb+Dbdst5uBiyJvlNhwwrcW06hQPWiJRc6sS+Ck5l06PJDtMw1rI7EhXxsz2XGA7BPh7yTzN8hGyNVd0IzP6ty3PL+GftdccCdwfVxzsHTZwd1EN8zbzWw1ZkrQEUS3puF5DhpxlhsBoF9qmZX8d0DzkFeFPG4Y2vM1it3GXZIgyDsnjhouxkSzbkIEjJXfdEXIUn7naQZh+XiW0FE9nttJkvLW9GOL5fD8KO1aLrBWV8nHIz6Q/8ntnvUyBwxzPh4VHaUbRd1uRQllTvb+w+8q0rMDGL+e8EY7UYL9ETyqfGDxh1ihok9Ykiv20f9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WyVDF5aP00AjwPzVPZOnsNHHH7AhevgKJjvt2yMMAQs=;
 b=fCmDkr7BOd9vLVngiJJyVRstK5xaV+5KYKcUQ5SnSH3uHhh+PVdyeMEzqmaRCMc4v9uOAsSmM717tlQf7URR4GQGY8CNxbpPDQf6FBZ/jfhgTkWs8t6zAvognOzXboYq7alzK6Yyx2QkBBne83Xp1KhgeR13SovTB+ZEEbDj11BPJRlw6dplr978v4nwuTNRfTAw+IsKT6rPcNHBBnQxJrecklDy1SMxcYzUjtajZYf3opIEDakEaezCeRRvkABE4+u+NziDepw6IrfWa0DAE+uVfE5P7Xs3+v+tDX1Uj+oZeoNXINmISXoZUPqxOC4ixen0xfY2+OIwo7O6sNf+Lw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WyVDF5aP00AjwPzVPZOnsNHHH7AhevgKJjvt2yMMAQs=;
 b=vsDTfBIm0A0VZwmSiTz2coqRrpC8LWfrtS5w1aHL9kLLg/QGsD1l+Vg4dag7psNafMlnCw7/aYlkaMdVWkahvZwujaEGQr31/mNlrN7phMLWvD66jdVntZzrf1Cfv81rwF5Aqd6q1NAJpLVBAHe+cEVe+Z6H0Xm2mRuD+QtnGSEUGh3xmvL/WXPEzurwMwMc5I6bo1MiGiGZGOpWIilHCuC4iPRGayp8XwQK1d0xis42HvS25rUfLmxQZ7RQzFT44ovjFmg2Z/TOHp0cbfnxvNiq3uHcigTexr8FoG0l7psn5biiw+6KDkUMLz8qBwxQbetitvssyg35vkXB080QYg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by MRWPR04MB12356.eurprd04.prod.outlook.com (2603:10a6:501:87::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.9; Fri, 11 Sep
 2026 22:37:49 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0406.007; Fri, 11 Sep 2026
 22:37:48 +0000
Date: Fri, 11 Sep 2026 18:37:40 -0400
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
Message-ID: <aqSCtL2kr6xczuB_@lizhi-Precision-Tower-5810>
References: <20260903115441.912500-1-zhouruizhe@resnics.com>
 <20260903115441.912500-2-zhouruizhe@resnics.com>
 <apnJ7MtNw59x-qWh@SMW015318>
 <AEEA1wBuK97oyrSN8q4l4KpK.3.1788520536000.Hmail.zhouruizhe@resnics.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <AEEA1wBuK97oyrSN8q4l4KpK.3.1788520536000.Hmail.zhouruizhe@resnics.com>
X-ClientProxiedBy: PH7P220CA0030.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:326::6) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|MRWPR04MB12356:EE_
X-MS-Office365-Filtering-Correlation-Id: a3ef0fdf-230e-4bcf-e1c0-08df10554e5a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|366016|376014|7416014|1800799024|6133799003|10067099003|5023799004|11063799006|4143699003|56012099006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	tOK9NVn5VWzRdsR36V0E5aVT0hdQpsxJ4VuOpZ2fY5L6nnjPhVT06WJXODYHnWAzfNc35tHFzigo8t79W4+E9o20haWO+3DqC5H90PdHBfnSOzFRyvMvVifTr9oScfraSst7Lc9BmhilZSeKoiaZRJA3l5LYwfygApe8JbjumBFwT/j84mMp9rGL6PSGnZxUyj/JoA5ExXqQcwgVEOddWw66u3WUP3wuPetLOvDu0tPTlimCpHJSZR+SIN0F8J3GjnNJI4BfLsSjTfIPN8rQLf1HZaZVSD1P+6FBq2p4m/vDlixZjwfscIFExJOtR/6ovBrH3SwnEI7XYD2v/7X34iTDYhvVdCS1DLYYSB02kkl1WTf7SP1kR+TCgU8nI76p/Szk80VvT9lT9fdT3fX1d+g7UlkXQKcGRs0RvmF5loxNjYbMmcsZ/sWALTU/ZmgVDLxz6cRgl/9sMfJ0uZ9CJENArKlNMZ8sFrmGNbGf+XP3ges0rJJo3zp6n/+RYc6BtwkTNS6vamDejGSMtfGTW8XB1nTffoElWWDfgXfxyM6NbxbPnWEDNb3OMx+dOmU2fKiarlC7ZSLgQouovtR3zxZH2Njo+jON2gxLL/lINUmFDVqmcQNl26WrY3+9PWDd
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(366016)(376014)(7416014)(1800799024)(6133799003)(10067099003)(5023799004)(11063799006)(4143699003)(56012099006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?S1lZWit1Y1E1WTZHaXdYOXgwaUZqenBkWU1JbG9OdjMzbmc2anVRazU3cExw?=
 =?utf-8?B?a0pIYVpRVW41ZVd0MzVuNWlEQkQ2d0k4WWJ4TXNJWjhETEMwNTlxcmhib0xp?=
 =?utf-8?B?M281QmpKNFhmS2IyM0RaOUhxM1lUWGpiWWhqS080Qkh3MFdXRCtUN25UYVdt?=
 =?utf-8?B?YWVCYlZzSHF5VGZxUThtSkVWWHRnL1J1SmpWc243MkVSempEczVYMTFZUnZt?=
 =?utf-8?B?Q0NoR21VM0tacThGcWdrZzhORU1MYzFXSzNnQmNsUVhDUVk0ZG13ZDZjMUNx?=
 =?utf-8?B?cnh2VDdFVWY0ZEUyUlAxMkVTYTlxaWFkaHk0QjluTTRVYkc3SVhFeW40WG4z?=
 =?utf-8?B?ZUNRWXJXY0tJNTJDZU82ZEN3SlJDMGo2QkQwV1NWRjBsMDc3MWpacnd3VDl3?=
 =?utf-8?B?Q0NiTmZyRDA2K1VvSkVHT01MdXl2ZTVMSUxhWTl4ckdwVUU0b2xTUnpLYVJi?=
 =?utf-8?B?SVc4WkJLQUtFQmFmNU9xU0pwSlAra3Zkd29vaXJMR2ZLV21Ha0ZoSnMvTXZr?=
 =?utf-8?B?MVExaUNDUlRPaTlyY3ZpTFUwVm1ZZXZvaDB5ZmRBZTJCdzVpZzlzenplZUpt?=
 =?utf-8?B?WjNHR244NDlOdFNOY09qaVVPZnNKMnpIWU90aEd2MmJVTjRDbUU4d01iTXBC?=
 =?utf-8?B?b2p2a3psTWNsV3BUbk5qNEJPZGhMVFp2RGVyMEtPTmxwdHpCM1A0eWtOYzVm?=
 =?utf-8?B?ajVpZEMwY056ZlJqVldFSlFWQWVEd0hBNzl5b0ZpVHJJbHNQSEQ0K2N1czlW?=
 =?utf-8?B?MmFpSndCNytFOVBRbWdMTkZld2s4ZXRsT0orMXdCWElYWnJvOGhHVk1QTXEz?=
 =?utf-8?B?MTNnbDA2dSs5TUVhTllPM1ZMbnJlK2YwdW9maW1FUXFiYVhuZGxnQm9yUkdN?=
 =?utf-8?B?RVI4aVltakxmS00xVlBqZlZQazJ0VHJsRHVHQnZ6RjFXM2lFZ1ptRzl1bG5t?=
 =?utf-8?B?UXFibnA0aDNYLzVTTS9abmUxVmtqaFN4UTgvNjdScHN5dDhZS2h6NFdRT3RY?=
 =?utf-8?B?d0Y4NkJXVy9LM3Y2bFF4cWlMaVJnZ3BhbXdSY2hVYUxTUGVOYnNHSGthb0w1?=
 =?utf-8?B?Qmx4dXgrOGRWVkpOeW4vNUNaY2w5Q1dmdVlZYnpZbFZmMktzd2E5OW9IUlN4?=
 =?utf-8?B?WVd4M0JEc0ZMNlZrckN3V1MvcW9Qcm9sMkRNTDRoaVk2UWhwYTRGSEgxRStK?=
 =?utf-8?B?dDZzVy9mQmhiL3FsaFhzOVZENEs5YWVOaWNMbCtiUXJ6cXRsMGVreEwvWkRp?=
 =?utf-8?B?aHhyVEZRY0xZK3NOTXU3djNoRmROa2FZUHo1M2ZYYXh5bmhXc3JYQlVsOW9F?=
 =?utf-8?B?dndQMTJHS0kreG9lWDhzeXFoc2YvU2JodjJXK0R5Q0tCaUJydXBMekQvMTk0?=
 =?utf-8?B?VllYNWMvYWlDaU84YXQrVjZhb1RvSzBrbFUwTmpsS1VndHl6ajhzU3ppdWVJ?=
 =?utf-8?B?ZzNOVEowQWVNTEQyRWI5aWFNdjBNdDBMelZlZkREaHB3R2tRT2VZQ1N4ckk2?=
 =?utf-8?B?YjR4ZGxFalZqdFVaeXJ0WW5IQ3Q4Y1VxNnlEbVZ5OXgxUi9TZ0JuQzA2SUhH?=
 =?utf-8?B?QUJoclNCU2ZKTXJRTXdKNloxdDlVMmtXeEJhSXBqakY5WG0rRzVWWm9NOW1r?=
 =?utf-8?B?SVNwWmpNQ1FBcmdCck1CQ3RrZm8wQ1d6ZVJGTzJqcityVmlWM0JMOXprcEpO?=
 =?utf-8?B?ZlZhVGwvQXVSd3l6cXF4MEhxS1BQUk9laWV0dlQxMTd5QjFMWjVBN2tLaitW?=
 =?utf-8?B?bUpFeXJSaFFCRXMrTmNHTFpuK0RCR3BOaHRWa0NEa0hTL05WcGY2dEtOM3VS?=
 =?utf-8?B?b09sZUd4anpmVzdnMnpJVnphU2QwdElPaFhmamcxVHV1Q1A3Z1NvVmZSTHRO?=
 =?utf-8?B?NUZkR1J0T1NvTTc4WGFXRHRkRTF5R29RSUxHYktHc3hhV1JlQ21hVk5HNXFR?=
 =?utf-8?B?WFRtangxRTNBcjBCR043MDVPS2NiNm5INkRJQ2MrdzF3b0VVaWV6TmtFcFVS?=
 =?utf-8?B?RmFvUEg4c3lMWlEzM1lsODE0SzVEMDZJZGttWFB2YUNKVHlLNGwyUFh5SjhK?=
 =?utf-8?B?UWdBTVJLRFUxTmNDYW1YR1VoWVVOZWEzRXhIWHBBR0RONVFNZEh1UUpaRXBh?=
 =?utf-8?B?aXJxSUhZcE5RZnVrSTRXSFlvUTMzRWNzcFZoRDNzRHJrMWpVR0M4d1Ixb0Jp?=
 =?utf-8?B?K3VTVnBwRXhEMU5WeFVNWkJRNms5YnUvTytwWXVTWDhJenVSZFk2NHZ4Snp2?=
 =?utf-8?B?bnRFQXl1MEVzUUFrc3dwck9pV0ptenJRVFlReGFZUWpjYkFacHJwNjFJck1H?=
 =?utf-8?B?TnJoTmFhL1RjNEQ5TFJxV2RsUmQ1Q1BKd1ZsTkoxZnJ4Z1VucEh6WnM3TjZj?=
 =?utf-8?Q?RurzHa6Tn7DBCxwJWDkBMNhlMkGDp90u7nn3T?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a3ef0fdf-230e-4bcf-e1c0-08df10554e5a
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2026 22:37:48.5637
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ot25uQX/xSv9DR5XfDNrbgD19B6xyw5a16e4JMEfxlEWCNg+R6CIm6YFOeQ+oH2IeCsWCbCIpGktEEuNkgTV1lnVKWIDS88UIE/1+7Ai+5vfEVH4Vfb3xyupOAIQ5uVY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MRWPR04MB12356

On Fri, Sep 04, 2026 at 07:15:36PM +0800, 周睿哲 wrote:
> Hi Frank,
>
>
> From: Frank Li <Frank.li@oss.nxp.com>
> Date: 2026-09-04 03:26:36
> To:  Ruizhe Zhou <zhouruizhe@resnics.com>
> Cc:  Vinod Koul <vkoul@kernel.org>,Basavaraj Natikar <Basavaraj.Natikar@amd.com>,Logan Gunthorpe <logang@deltatee.com>,Orson Zhai <orsonzhai@gmail.com>,Baolin Wang <baolin.wang@linux.alibaba.com>,Frank Li <Frank.Li@kernel.org>,Chunyan Zhang <zhang.lyra@gmail.com>,dmaengine@vger.kernel.org,linux-kernel@vger.kernel.org
> Subject: Re: [PATCH 1/3] dmaengine: ptdma: Remove obsolete 32-bit DMA mask fallback>On Thu, Sep 03, 2026 at 07:54:39PM +0800, Ruizhe Zhou wrote:
> >> [You don't often get email from zhouruizhe@resnics.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
> >>
> >> The DMA API guarantees support for masks of 32 bits or wider and
> >> explicitly identifies retrying a 32-bit mask after a wider request as
> >> incorrect:
> >> https://docs.kernel.org/core-api/dma-api-howto.html#dma-addressing-capabilities
> >>
> >> Remove the obsolete fallback while retaining the error check so that a
> >> genuine DMA setup failure is still reported and aborts initialization.
> >>
> >> Signed-off-by: Ruizhe Zhou <zhouruizhe@resnics.com>
> >> ---
> >>  drivers/dma/amd/ptdma/ptdma-pci.c | 8 ++------
> >>  1 file changed, 2 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/drivers/dma/amd/ptdma/ptdma-pci.c b/drivers/dma/amd/ptdma/ptdma-pci.c
> >> index 22739ff0c3c5..d36bb9c67325 100644
> >> --- a/drivers/dma/amd/ptdma/ptdma-pci.c
> >> +++ b/drivers/dma/amd/ptdma/ptdma-pci.c
> >> @@ -178,12 +178,8 @@ static int pt_pci_probe(struct pci_dev *pdev, const struct pci_device_id *id)
> >>
> >>         ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(48));
> >>         if (ret) {
> >> -               ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(32));
> >> -               if (ret) {
> >> -                       dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n",
> >> -                               ret);
> >> -                       goto e_err;
> >> -               }
> >> +               dev_err(dev, "dma_set_mask_and_coherent failed (%d)\n", ret);
> >> +               goto e_err;
> >
> >also needn't check return value, it always return success if mask >= 32.

Add Christophe JAILLET and Christoph Hellwig

https://lore.kernel.org/all/6a4df3e0a0849f179f9747f47b9c8cae53b29b59.1641752692.git.christophe.jaillet@wanadoo.fr/

Frank

>
> I did some more checking after your reply to make sure I understand
> whether dma_set_mask_and_coherent() can actually fail for a mask wider
> than 32 bits, and whether keeping the return-value check is necessary.
>
> I also read your August discussion with Michal Pecio on the same
> question:
>
> https://lore.kernel.org/all/aoMty9Dvt2bnWm74@SMW015318/
>
> In that discussion you pointed out that dev->dma_mask should already be
> initialized by the bus before driver probe, and asked whether there are
> any dma_supported() implementations which can actually reject such a
> mask.
>
> I agree that !dev->dma_mask does not look like an interesting failure
> case for a normally probed device. However, after going through the
> current dma_supported() paths and the in-tree .dma_supported callbacks,
> I found several other cases which appear to make the stronger "cannot
> fail for >32 bits" statement incorrect.
>
> The current path in kernel/dma/mapping.c is:
>
> static int dma_supported(struct device *dev, u64 mask)
> {
>         const struct dma_map_ops *ops = get_dma_ops(dev);
>
>         if (use_dma_iommu(dev)) {
>                 if (WARN_ON(ops))
>                         return false;
>                 return true;
>         }
>
>         if (ops) {
>                 if (!ops->dma_supported)
>                         return true;
>                 return ops->dma_supported(dev, mask);
>         }
>
>         return dma_direct_supported(dev, mask);
> }
>
> and dma_set_mask() does:
>
> if (!dev->dma_mask || !dma_supported(dev, mask))
>         return -EIO;
>
> For the generic direct-DMA path, the situation is clear:
>
> int dma_direct_supported(struct device *dev, u64 mask)
> {
>         ...
>
>         if (mask >= DMA_BIT_MASK(32))
>                 return 1;
>
>         ...
> }
>
> So dma_direct_supported() itself cannot reject a >=32-bit mask.
>
> However, this does not appear to be true for every path through
> dma_supported().
>
> My audit of the relevant current callbacks looks roughly like this:
>
> +----------------------------+---------------------+-----------------------+
> | Backend / callback            | >32 can fail?           | 64 can fail?                |
> +----------------------------+---------------------+-----------------------+
> | dma_direct_supported()        | No                          | No                          |
> | default dma-iommu              | Yes, conflicting       | Yes, conflicting       |
> |                                                | dma_ops state       | dma_ops state        |
> | ibmebus_dma_supported()    | Yes, !=64 fails         | No                          |
> | xen_grant_dma_supported()  | Yes, !=64 fails         | No                          |
> | xen_swiotlb_dma_supported | Yes, threshold         | Not due to width   |
> | ppc dma_iommu_supported()  | Yes                       | Yes, if no table        |
> | parisc sba_dma_supported()  | Yes                         | Yes, if no IOC           |
> | parisc ccio_supported()         | No for >=32          | No for valid dev       |
> | alpha_pci_supported()           | Yes, threshold /     | Can fail if no             |
> |                                                | mapping dependent   | usable DMA path|
> | dma_dummy_supported()      | Yes, always           | Yes, always                |
> +----------------------------+---------------------+-----------------------+
>
> There seem to be two separate issues here.
>
> First, "any mask wider than 32 bits cannot fail" has direct
> counterexamples.
>
> For example, arch/powerpc/platforms/pseries/ibmebus.c contains:
>
> static int ibmebus_dma_supported(struct device *dev, u64 mask)
> {
>         return mask == DMA_BIT_MASK(64);
> }
>
> and installs it in ibmebus_dma_ops.
>
> Therefore a call such as:
>
> dma_set_mask(dev, DMA_BIT_MASK(40))
>
> will fail even though the mask is wider than 32 bits.
>
> drivers/xen/grant-dma-ops.c has the same rule:
>
> static int xen_grant_dma_supported(struct device *dev, u64 mask)
> {
>         return mask == DMA_BIT_MASK(64);
> }
>
> and xen_grant_dma_ops installs this as .dma_supported.
>
> So, for that backend as well, DMA_BIT_MASK(40), for example, is
> rejected.
>
> These two cases seem to directly contradict the more general statement
> that dma_set_mask_and_coherent() cannot fail for a mask wider than
> 32 bits.
>
> There are also cases where even DMA_BIT_MASK(64) can fail.
>
> One example is the PowerPC legacy IOMMU backend in
> arch/powerpc/kernel/dma-iommu.c:
>
> int dma_iommu_dma_supported(struct device *dev, u64 mask)
> {
>         struct iommu_table *tbl;
>
>         ...
>
>         tbl = get_iommu_table_base(dev);
>
>         if (!tbl) {
>                 dev_err(dev,
>                         "Warning: IOMMU dma not supported: "
>                         "mask 0x%08llx, table unavailable\n",
>                         mask);
>                 return 0;
>         }
>
>         if (tbl->it_offset >
>             (mask >> tbl->it_page_shift)) {
>                 ...
>                 return 0;
>         }
>
>         return 1;
> }
>
> If get_iommu_table_base() returns NULL, the callback rejects the mask
> regardless of whether it is 32, 40, or 64 bits.
>
> I understand that an unavailable IOMMU table may represent an
> unexpected or unusable DMA configuration rather than an ordinary
> address-width limitation, but that seems exactly like a reason for the
> driver to retain the error check and abort probe instead of proceeding
> as if DMA setup succeeded.
>
> There is a similar state-dependent failure in
> drivers/parisc/sba_iommu.c:
>
> ioc = GET_IOC(dev);
> if (!ioc)
>         return 0;
>
> /*
>  * The max IO Virt address will *always* < 30 bits.
>  */
> return mask >= ...;
>
> For a valid IOC the required address range is below 32 bits, so a
> 64-bit mask works. But if GET_IOC(dev) fails, DMA_BIT_MASK(64) is still
> rejected.
>
> The default dma-iommu path also appears to contain an intentional
> failure condition:
>
> if (use_dma_iommu(dev)) {
>         if (WARN_ON(ops))
>                 return false;
>         return true;
> }
>
> The intended state is:
>
> use_dma_iommu(dev) == true
> get_dma_ops(dev)   == NULL
>
> because the default IOMMU DMA implementation does not rely on a
> dma_map_ops instance.
>
> However, if use_dma_iommu(dev) is true and get_dma_ops(dev) is
> non-NULL, dma_supported() deliberately returns false, independent of
> mask width.
>
> This looks particularly significant because this was explicitly
> discussed when the default dma-iommu implementation was changed from
> dma_ops indirect calls to direct calls.
>
> Christoph suggested moving the consistency check out of the fast path
> and doing it in dma_set_mask(), "And fail the call while we're at it."
> Leon replied that he would add it to dma_supported():
>
> https://lore.kernel.org/all/20240718070406.GK5630@unreal/
>
> The same discussion also says that the default-IOMMU state implies
> !ops.
>
> So the resulting WARN_ON(ops) path appears to be an intentional reason
> for dma_set_mask() to return an error when the DMA backend state is
> inconsistent, including when mask == DMA_BIT_MASK(64).
>
> Another concrete case is dma_dummy_ops.
>
> kernel/dma/dummy.c has:
>
> static int dma_dummy_supported(struct device *hwdev, u64 mask)
> {
>         return 0;
> }
>
> so dma_set_mask() fails for every mask, including DMA_BIT_MASK(64).
>
> I initially wondered whether this was only a theoretical sentinel that
> could never be seen by a driver probe, but there is a real setup path
> for it. acpi_dma_configure_id() does:
>
> if (attr == DEV_DMA_NOT_SUPPORTED) {
>         set_dma_ops(dev, &dma_dummy_ops);
>         return 0;
> }
>
> Since this returns 0 from DMA configuration after installing
> dma_dummy_ops, the device can continue through the driver-core setup
> with DMA deliberately marked unsupported. If such a DMA-using driver
> then calls dma_set_mask_and_coherent(), the return-value check is what
> prevents it from continuing with an unusable DMA backend.
>
> I agree this is not representative of the normal case for a healthy
> PCI device, but it does seem to demonstrate that a 64-bit mask is not an
> unconditional success guarantee of the DMA API itself.
>
> The formal DMA API documentation also seems to reflect this. In
> Documentation/core-api/dma-api.rst, under "DMA addressing
> limitations", it says:
>
> All the below functions which set a DMA mask may fail if the
> requested mask cannot be used with the device, or if the device is
> not capable of doing DMA.
>
> and dma_set_mask_and_coherent() is documented as returning zero on
> success and a negative error on failure.
>
> So I think there are two different statements here:
>
> 1. For a normally configured DMA-capable device, a 64-bit DMA mask
>    should be supportable.
>
> 2. dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64)) cannot return
>    an error, so checking its return value is unnecessary.
>
> The first looks like the intended normal-case invariant, but I do not
> see how the second follows given the current dma_supported() paths
> above.
>
> In particular, the PowerPC IOMMU table failure, the
> use_dma_iommu(dev) && ops consistency check, and dma_dummy_ops are all
> paths where the mask width itself is not the problem but
> dma_set_mask_and_coherent(..., DMA_BIT_MASK(64)) can nevertheless
> report failure.
>
> That is why I currently think code like:
>
> ret = dma_set_mask_and_coherent(dev, DMA_BIT_MASK(64));
> if (ret)
>         return ret;
>
> still has value: the check is not probing whether 64-bit DMA
> addressing is supported versus some narrower address width. It is
> checking whether the DMA setup as a whole succeeded before the driver
> starts using DMA.
>
> Again, I do not work within the DMA subsystem, and therefore I won't exactly
> claim myself to be an expert on this. The above are some findings after some
> digging. So correct me if I am wrong.
>
> Am I missing an invariant which makes these failure paths unreachable
> for a driver calling dma_set_mask_and_coherent()? If not, then I believe the return
> value check is needed, and the DMA HOWTO document might need to mention that.
>
> Thanks,
> Ruizhe
>
>
>
>
> >
> >Frank
> >>         }
> >>
> >>         dev_set_drvdata(dev, pt);
> >> --
> >> 2.27.0
> >>
> >
