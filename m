Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011053.outbound.protection.outlook.com [52.101.65.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10AFB2DCF57;
	Thu, 16 Jul 2026 18:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784228311; cv=fail; b=gdgfqTUJ2bQSmZpuikCEm9CZZeIF51woZwGjdJwQyez2OzTV21y69c1TnH/X7EDF9QXkigfBNFGN5mLh/ONqligV8oW3u4caX+UNrEoFkbqqfElkf9/1e25czP/n3wZjyfxI/N9DNIsHlDZml0c7Iu6a14WmNFyKvwPymLJ0zic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784228311; c=relaxed/simple;
	bh=0ipSNhD9aRu84LrTlLooTb5ZnSHCOehOUHa/hAZpx7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=oNFPXEAsGu4WUwKpXLfdcW1nk1adBVfuOdok3axulK7aIMr/VCCx4R5P6jHpygFBmIcJBMH7pSIreWAqZzJevrsWfuM1Pplrmv+/3zqZeHsIEF/MXhh+bY0AFNVOheboRqnG4ytyrpvvmXa27w9hhC585AfVTnjNvQ1ksmOqwtE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=T5Ui/BSb; arc=fail smtp.client-ip=52.101.65.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="T5Ui/BSb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=riMalTBTqy0bL54MdN33GxkUot7/CLQ3kLuxnxinLf8SswdVETK4XS+epyEShBl05tvjhU/LWOMyApl0QUuBQynpwnA+bVnr2w2l79WWHbO/t7XU8nzQAKToENbE58C8x3MQS4JKXhOiDKzXCx+Z/tkifFyjwFmdLtZy1BngkpNVSGhep3EGhhJPExLkeRJjzl+RrGWc/MyUzKTncqXxhG2uDHg3TNVls8JSoRXaNNQ8m0LtDKjO0O6ZSHjWR6ZYC/dvqimE+cJJL2eKUQjR9weBu5NdO6xWeSzkDrWEt0qb54jsgbG6H47fr2Zh5yDkxX/KRSBVcMmw8rrYMjnlPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=WcR3vWtQxBfPwzF7/ow8gbL2hQylL4RmGtzbS9EPJBE=;
 b=FGbEwfD7b/IX09t9NAaOYWV7uSTx/urmTvFbUA1MHbbSpsLMEC6LeZ+IJsps074xxQawtNzNsJkqUUsRSz5h8L4Hb1Ga51cr1M4FN8kEkWXldAesVW8RU1ahfgjSoQqhN2oYjizlClfHINekayPHxDfe8lu1N3aib7Ygc9xcUgVntxcOMOYRURJ7NybOoE3FtWwmn2JfxxxYTR9z5599BrGvHc/cyb5VFueYedoGAX6TWtxMFm1vZkNRauiKitZfB88VepX2eQeCfsXOl5BpqAIwu4YXOLYN7qGjRuT6ddReY3GB4wC3zyHDsIOVwcoxsYZEmHMkzj6Z+yviKg/Tmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WcR3vWtQxBfPwzF7/ow8gbL2hQylL4RmGtzbS9EPJBE=;
 b=T5Ui/BSbCoHjH96tm/279YQVkDR5OktCVHeYYTZx1/pi19egafhca1gM7D0sWJ3ys/S8368BxPwSKkVXhoOlg7GPldc4m+Od6RScyLYiGShU1Oxe1yvJQM4aWPdYhiiXGCqrO3ngcRSsuQLY2/d6aBFGaQE3vIYNzfJpuo9jBzkIuyF10k1Z1NTL/sz8iCHXxmHYPF0LD2f+JQOFlHrxwNqF1DhkRhFQ7K1Za5NLyyTypK42RrDd1+8Ic2Qz9wE60sJEJbExcleDS21PWyyBcL+Qwz/SqCX3t+wsSejL/DWvg/ugnUrW4HKZxa7RyNZl1mkU+Fi/Duob5estfYSZeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by PAXPR04MB8941.eurprd04.prod.outlook.com (2603:10a6:102:20c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Thu, 16 Jul
 2026 18:58:27 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%6]) with mapi id 15.21.0223.011; Thu, 16 Jul 2026
 18:58:27 +0000
Date: Thu, 16 Jul 2026 14:58:20 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: dmaengine@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/3] dma: fsl_raid: keep MMIO bases as void __iomem and
 cast at access
Message-ID: <alkpzMtQRXJAjZLm@lizhi-Precision-Tower-5810>
References: <20260714233855.870797-1-rosenp@gmail.com>
 <20260714233855.870797-3-rosenp@gmail.com>
 <alkOwebrTsoMTX7l@lizhi-Precision-Tower-5810>
 <CAKxU2N_iW3ygrzfPDBvSkeOOxoA0eHG_bnASLZbhV4aYphDrKw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAKxU2N_iW3ygrzfPDBvSkeOOxoA0eHG_bnASLZbhV4aYphDrKw@mail.gmail.com>
X-ClientProxiedBy: SA0PR11CA0024.namprd11.prod.outlook.com
 (2603:10b6:806:d3::29) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|PAXPR04MB8941:EE_
X-MS-Office365-Filtering-Correlation-Id: 13da6a2c-a3ea-4bfa-91c3-08dee36c37da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|19092799006|6133799003|4143699003|22082099003|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	hWGQ2a+OOWw82GiqXwBhsYkQg/RhO+PJOd1E5QpX2AFzkD8fUh/giB6C8GQfDwkgJLBq/A9WJP5txt2lxL5kaBf+bbHhJECQZtdnXqPoQH2KgyTJ0aQhgYvEqNkrLmxYzxL19Q23n7aJ/TSrHgj4qR/tSRCIq6Kqc4LConu+WuW9w0BwYQO4SleF6EYhR8Thipp+MQ36+qkDxVpn/lNOT+ihn5pw389DgLSoJS5+dcnzgMIGWd9wl0cpnsEg/s+eEB2hPam0aXtifKRwr2DYwfnqxEjgB7LM3ozXSlqNN4NrZt0O+V40aFpjOXXi9r0q6X9xtNKH97xwauhKX3jnVZb5KhpTp8FpvxDzXj+qCazt/TWl8RTlYKIn8mC0bQZSMs+Um1+hOGOuIRnP0DZRj/5/A9Ek18EkFv9CRglA8IPgLdv2vsmXkZMTA1EnJ3bWoByNTOm6iFlHZeopVg4/6crbBS6Cpox6Sv0dwo16m53HFU4WBRb3IiB7TNDmor5pJE5DD1qvDGqjt5Fp1Z3p0Q35d7M++yNkX8Fo4numn3W+A4710fYRKJB4BSEy3o+//60XSkCCPHXg2MeCfNLTwLww/nhS3GR598o/MfqULBYBSl15t3VSHzwzVBF1124gCYBTkLafwMdRMfykaYcC6CQyhlDffJcdSu+wcBK6utE=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(19092799006)(6133799003)(4143699003)(22082099003)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bjZXZHNYeEs2aGtsaE9uc25aMGNsV0FDeHlvdlpCbjFRT1huWFByb2ExTFI1?=
 =?utf-8?B?bXBxQkc1NTdZWVhYRkVia0dHeEVoamZqd2hzNFdTMHJ1dFkrSkFMMlZNMDhJ?=
 =?utf-8?B?d2pDemlqejdOaWRTVUFRTWoyM3VwYlBsUTU0ZW1oc0VEdTM2L1V2dmpvV2VQ?=
 =?utf-8?B?cmdKV0ZVb2dIWWNkVVhUdmdqRFcweVVKakJlZjZCMzhjbGZLVlRaN3RBazM0?=
 =?utf-8?B?T1oraU1WaHd6UTlVMnZZMXpzMnd0NHNldjZPZXBzK1VTUEx4QU1kNEpkQ2wr?=
 =?utf-8?B?djAxaE9LU25Od2REMGNISGQrcmJkU2Z2NHh3MnNzdURTOUUxTW00dnZVWHU3?=
 =?utf-8?B?ZGo0RldBZ1VOSHkvYlV5L1BYYW8xL3lZYktDUnNOYTdUN0s4MEYrWHlOWnJ3?=
 =?utf-8?B?MnQ1MmpvVE9VbThXWGRVTlN3MENGUEF5SjV2S1lVaWhWSEtPbnRMaU1hRGZF?=
 =?utf-8?B?M2VyZmJNZ2oydjNqMXJEdE9nK01pQVhyTW9UU3JXRVA0Ui9jNThReXdMa25T?=
 =?utf-8?B?THFTV3NyZHo2WlpwVDViT2hMQWwrZ1RUNFpPRDBiOHplMTVQVjd1ZVpXcjdC?=
 =?utf-8?B?cmh1M0hSTmFzSTc4NGhUTEJZZE5HTG5MRVpDMElZY0V2RGNhanEvK3V1dlBS?=
 =?utf-8?B?M0wrVVVvMllDbEFtK2FyaHQyYVhHVlFrc0hSWkc4Zk9pdjM4aHVEVWFGV05h?=
 =?utf-8?B?a2IvQzlLOVFUbFo5YjI2dlhjbGtQWlp3Si9abnNMUmpHcmZrUW84T1J5Z1Nl?=
 =?utf-8?B?VXFqNzQ0bHF2Uys5emxwbzZFN1JqOEh0T0x5NU5OWTh4ei9JOUtTMGFLWVhY?=
 =?utf-8?B?YU1jYzJDZnBFVGo0ZFZmL2V0R01sY1puTFRKMEswRnhkWFNnTlpYSmZmK25G?=
 =?utf-8?B?ZmNKZEtkREhwTllXeDV3R1Zhb3dQVDF5Q2NLUFFreVdad2h4VWd0OG5FVzFQ?=
 =?utf-8?B?K2FxRnZoeG1nRVdTMkRKYzZvM0xDUm9uUXZ3S3daNkJQanZaaXJVazVVVWhw?=
 =?utf-8?B?VHVLVm9xNlpaSnAzaEZlRUFiU0lraCs4Zzh1azNTODJRZmV3NkZ3dU1KOE9t?=
 =?utf-8?B?bDc1ZjNBa25SaWRiV3E1WGhPL2tyUSt3Z1JoSVNYZDdpckxqSW1QY1I5WUZl?=
 =?utf-8?B?dk1ScUJtankzalRBck12ZnBXa0pCdTg3d2JuS2ZvNXdWMjNpbzFPTGtZM3Jn?=
 =?utf-8?B?cWNZQ1cxMmRNTUpIaGZHVkJvbENKV0F0T2RkNEZENG9sVmtLR2VqWGRUSURE?=
 =?utf-8?B?NnNvNWsvU01nRGo3M3NSZ2V4SVQ0eERTUnE5bzc4WDBudG5Vb2N1WDhYRTk0?=
 =?utf-8?B?QWVFblNObVpscjljbTdHd3VSWlpGMERyYXVCcjZNTFhuZGlZbFNoN0VGS0Ft?=
 =?utf-8?B?SjFNR084a0xTZ0g5L2VJcDdENCtCZWxuUWplWis5MFdUalhhKzVrbEJTaHdz?=
 =?utf-8?B?N2NFcVhJRFFaMkNkcks4Y1JMWkI4SjJzcG1RV2RWek1wd2QrYUZPbWp6T2Fu?=
 =?utf-8?B?cXZ3MDN6OThtd24vTTJCS1ZhNkNFOVFGbWROTHpVbGhPaDNXNXJYZmhSbkhz?=
 =?utf-8?B?VEVMdE1RY3g3Qk54eWkrWE1wR1RVWmRhZFcweDZ4Yjhmd3hyVDZRNEwxa3Qw?=
 =?utf-8?B?T2lWYVRRVGo4S1UvczZwdU9PQmtubTBNQzZ0bVdGZHhSR1BnOWwycEJtclMx?=
 =?utf-8?B?UW1adlVjVkNTazg4Wm5uYXFEYjNJNnc1WW9TaVhUM2p6Z3oxaHc2SXA2UVhm?=
 =?utf-8?B?aUNaS0tGdys4ZmZlcXFodmxJOTNQVURjQUZncEUxS1NxTk5ma1IyaVJZNVg4?=
 =?utf-8?B?aXRMS3J3VkNUbXZ3N0FydnkxQmlVZm9leGFScmt4L1Y2UzNUK0J5Z1hVUEpF?=
 =?utf-8?B?WnV5WWcwbG9iNFByUjNSSnhzTVBYSi9QUnpqSnNDMXd2NUtIZWtGVHluTFFX?=
 =?utf-8?B?c0kxR0VQNTZlWkNoWHNUZXlWTFhnanhmNXc0OURza3dwZmp6bkNhVExrUDl3?=
 =?utf-8?B?Z1YxSjNUbWRZdzR1eU5BMDVCdVVDRjhUbVc1S0tvLzh3ZTBTSDRQUVh5dzBF?=
 =?utf-8?B?Q2RSNUFaanRoeUlaWk5WRGgreStUWERZYk5UUUMwV2Z2Y1kwQzhsc0JEOEda?=
 =?utf-8?B?a3JZR2EyVVBIekV0MlNYNjFmYnZpUkd0dXVyNkIrcUQ3Y2RPc1diek9sdXRZ?=
 =?utf-8?B?a0twSnlzMXFSYXdJNmdKc0N3dXdDa2N1LzV0L1FnNVNIT3hYYjQwcExnUVZX?=
 =?utf-8?B?QXhyWk5yM3VHMFgzeW5LbERRYjJjVHFMUE5DUFZFVWhnRkg4Q0FtT0RpV0E1?=
 =?utf-8?B?M3VjKzFVVWI4ZGtacGp3ZDM5cmJrdktUVU1leG9YWU1TY2d4UmV1UFd4UGE2?=
 =?utf-8?Q?Q4AB0EleCwbOTp0ib95kIr8sLWKgMLH9B1Md7?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13da6a2c-a3ea-4bfa-91c3-08dee36c37da
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2026 18:58:26.9127
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SId/dW/aXoGiVLVSa69U8J2s2AmYn28wocXurs4GsEQdW52Vb9Bx5rTSRJShkLdQYKwafT4KuVRTZmkc/bqQ1eKS4Bf0+aZ1GhJ22B1uOOQ0nj6KkMSPNY9bSU/uxWQm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB8941

On Thu, Jul 16, 2026 at 11:35:31AM -0700, Rosen Penev wrote:
> On Thu, Jul 16, 2026 at 10:03 AM Frank Li <Frank.li@oss.nxp.com> wrote:
> >
> > On Tue, Jul 14, 2026 at 04:38:54PM -0700, Rosen Penev wrote:
> > > The fsl_re_ctrl and fsl_re_chan_cfg structures describe memory-mapped
> > > RAID Engine registers accessed only via ioread32be()/iowrite32be(), yet
> > > the pointers to them (re_regs in struct fsl_re_drv_private, and jrregs
> > > in struct fsl_re_chan) were not __iomem-qualified, so sparse emitted
> > > "different address spaces" warnings for every register access.
> > >
> > > Store both MMIO bases as a plain void __iomem * and derive jrregs with
> > > void __iomem * arithmetic from re_regs, rather than carrying typed
> > > register struct pointers through the driver. Each function that touches
> > > the registers introduces a local typed pointer (struct fsl_re_ctrl
> > > __iomem *ctrl / struct fsl_re_chan_cfg __iomem *jr) and uses ->field,
> > > which is the idiomatic kernel pattern and keeps the registers' __iomem
> > > qualification intact.
> >
> > Any document or reference show this is idiomatic kernel pattern?
> Closest thing I can find is
>
> https://lkml.indiana.edu/hypermail/linux/kernel/0409.1/2592.html
>
> As the link mentions, it's real nice to avoid the unnecessary casting in
>
> chan->jrregs = (struct fsl_re_chan_cfg *)((u8 *)re_priv->re_regs +
>                off + ptr);
>
> sparse would flag that anyway. __iomem would need to be added to both pointers.

I see.
...
> > >               return -EBUSY;
> > > +     re_regs = re_priv->re_regs;
> > >
> > >       /* Program the RE mode */
> > > -     out_be32(&re_priv->re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> > > +     out_be32(&re_regs->global_config, FSL_RE_NON_DPAA_MODE);
> > >
> > >       /* Program Galois Field polynomial */
> > > -     out_be32(&re_priv->re_regs->galois_field_config, FSL_RE_GFM_POLY);
> > > +     out_be32(&re_regs->galois_field_config, FSL_RE_GFM_POLY);
> > >
> > >       dev_info(dev, "version %x, mode %x, gfp %x\n",
> > > -              in_be32(&re_priv->re_regs->re_version_id),
> > > -              in_be32(&re_priv->re_regs->global_config),
> > > -              in_be32(&re_priv->re_regs->galois_field_config));
> > > +              in_be32(&re_regs->re_version_id),
> > > +              in_be32(&re_regs->global_config),
> > > +              in_be32(&re_regs->galois_field_config));
> > >
> > >       dma_dev = &re_priv->dma_dev;
> > >       dma_dev->dev = dev;
> > > diff --git a/drivers/dma/fsl_raid.h b/drivers/dma/fsl_raid.h
> > > index 69d743c04973..6069615e2e1e 100644
> > > --- a/drivers/dma/fsl_raid.h
> > > +++ b/drivers/dma/fsl_raid.h
> > > @@ -256,7 +256,7 @@ struct fsl_re_hw_desc {
> > >  struct fsl_re_drv_private {
> > >       u8 total_chans;
> > >       struct dma_device dma_dev;
> > > -     struct fsl_re_ctrl *re_regs;
> > > +     void __iomem *re_regs;

Suggest rename 're_regs' to 'base' to disinguish easily typed or void pointer.


> > >       struct fsl_re_chan *re_jrs[FSL_RE_MAX_CHANS];
> > >       struct dma_pool *cf_desc_pool;
> > >       struct dma_pool *hw_desc_pool;
> > > @@ -273,7 +273,7 @@ struct fsl_re_chan {
> > >       struct device *dev;
> > >       struct fsl_re_drv_private *re_dev;
> > >       struct dma_chan chan;
> > > -     struct fsl_re_chan_cfg *jrregs;
> > > +     void __iomem *jrregs;

struct fsl_re_chan_cfg __iomem *jregs;

reduce many change. still can use
	chan->jrregs = re_priv->base + off + ptr

Frank

> > >       int irq;
> > >       struct tasklet_struct irqtask;
> > >       u32 alloc_count;
> > > --
> > > 2.55.0
> > >
