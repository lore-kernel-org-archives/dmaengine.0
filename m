Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010009.outbound.protection.outlook.com [52.101.69.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 595F63D9DCA
	for <dmaengine@vger.kernel.org>; Tue, 28 Jul 2026 15:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785253110; cv=fail; b=FiUCiTcbGTmofADWW97HI7JUTHtM7p+9+fwrbQDr+yAkIficnZnSC4diRfA2QF8tSSuu97YLxxZD79aVe0Cbh7kpoC2LLJdj1KutAndvy8nZcycBrTb47hcjv1PQV7Egg0gVkS3xIDHHImi6K323tDFgIZZYGhzU8EbF4dINS54=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785253110; c=relaxed/simple;
	bh=6p84OQddlTWgnO4/i3jtO8gjitSdfbhH8k0m3HCu1LQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=KRChzkWtJSQIC4xtl3xl6+cj3mYlRuCx5tn7Yd7m+gjyPGdegQX4j5SbR2GMCq+5AjlsExzvOF8uYjg/5CupC7ukGja1Uon2YhIeXemzvfwbmo7fBkjy0JbtnYz/cNtUgwtzYLoXiJhKFQx3Bav6evYs0vsumRcaMNUtxtSr9to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=lDrywrSK; arc=fail smtp.client-ip=52.101.69.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="lDrywrSK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k8n5n68x2YDLd3/wtkJT/F1h5eQ1X2tBIIaznzPY0N5/sB7eWIhOf7aNmfKLlfh7ko7ucuzynetSNBa1j49Kvart2gFRGfFhqXnj2jFHukWgrVRtHxBpWmV+3HlfRQKVcVxchAUm5JkQoBaNsCSnYhbgYvEN8hQO5QTKQvllJpobs0Gu1k8dEjy8OQPunj9ZS1EM46C6wHQ8eTsRMelD9/jiSRACWYvuZGt4xvVDtx/ybTkf+Ug9OEZgrB1szrM31BXmi/VO/vnQUEKv7CJEjsx3LoeeJqg2wlCjSABYNVzNp3PDOK9kiGznvHNxTcNZu006yQdPch3b5vZnKVatZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVNGvSUkSOMZHob9F0HtHE7zRB1OZzTgErByXSK4qYQ=;
 b=WK4uMWKBt86+Gveo3fzbjsV0JJwa0lvSBNX2+Zc4ZwFLs3vlxKAMj/DFQN5vOMatDMAUP7wQNUfsHHu84K39/JMu5fDFBmZ0LCz0s3E8IySzcxfmEtSG4YtPLNNY+FJb9eaB39McjGud9kwlKMC856EonCE9LYT9JAhX2zlgWGfRTfnukP2WiKDdVgzW1fk2Oh2PaOVviWA8ACkahsrYtBkgTRjgaAzv/PqGaOBmTEPcmkZ+KlRIhb1W8OcnpqctxEnXknyM1RWPx7aoIoQMPAD06wbOOWwH31kxiriIJqnlyYUzjQRkazXGXO09sY4eHdx3lnS/Pl4W3Qik0tMEDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iVNGvSUkSOMZHob9F0HtHE7zRB1OZzTgErByXSK4qYQ=;
 b=lDrywrSKoaosrfd56/p1Ghn2X8EDqQ3Y5k67oialKYkVbbHSwmAkD5tjrijybTnziITNX1LE1xMvK2/Cy+gTXaKrfVdXp+jRlmAK1MYd1ySzZTz1t5rnAGaTA/cTiq5NK9gi0pbv5Hslg4RZbcHKgdI4ZriX9WTgxCvBNHCkJJhQYvKKThGPs9cCUG4vYWsw4zCl0PJny3MeKaOY2XjMHy4bjSs6zuFVuKpmqNtL6+/g/4TOkbnYQrLROlisyieFjhTnlr0/5kgy74vYL8SkxhqBWeOsYUq9e6A/G3uV98oxeni1BDb0cnTfG0mOhLPMVQCrOFzLRoMYP0PVDldJLw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com (2603:10a6:150:2cf::9)
 by GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Tue, 28 Jul
 2026 15:38:25 +0000
Received: from GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c]) by GV2PR04MB11799.eurprd04.prod.outlook.com
 ([fe80::2146:83a2:5329:b7c%7]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 15:38:25 +0000
Date: Tue, 28 Jul 2026 10:38:18 -0500
From: Frank Li <Frank.li@oss.nxp.com>
To: Martin Kaiser <martin@kaiser.cx>
Cc: sashiko-reviews@lists.linux.dev, Frank.Li@kernel.org,
	dmaengine@vger.kernel.org, imx@lists.linux.dev, vkoul@kernel.org
Subject: Re: [PATCH v2] dmaengine: fsl-edma: tracing: no ptr dereference
 during log output
Message-ID: <amjM6hWy6oUXF2Rt@SMW015318>
References: <20260718130024.341243-1-martin@kaiser.cx>
 <20260718131453.A94821F00A3A@smtp.kernel.org>
 <amhmDM2DWyL3ngRc@nb282.user.codasip.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amhmDM2DWyL3ngRc@nb282.user.codasip.com>
X-ClientProxiedBy: SA9PR13CA0109.namprd13.prod.outlook.com
 (2603:10b6:806:24::24) To GV2PR04MB11799.eurprd04.prod.outlook.com
 (2603:10a6:150:2cf::9)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB11799:EE_|GVXPR04MB12038:EE_
X-MS-Office365-Filtering-Correlation-Id: 7145ea29-e5af-4880-6ab9-08deecbe4380
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|19092799006|366016|23010399003|376014|4143699003|10067099003|11063799006|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	MGFTgZnmZDUSEVWrggOpg/B0FqBuZEHXwDGtAj1WBpzSQR1w3rSvR9kHVhhH4a4j/Ihx6qyLQy2NbFvlgU2VNfeWhU6V//7Y0LroERBiraIsJzBumGbdnE4Z+U/xVsRHOtxVO61JrwRoTf5S4cm0fVLNCTVKsF+wRK1S/TOlXtuS5pr0T8xdCxabU9GXkbBkDnKihVg8WquW4EUth26RTV+zaSd5rhsGr2dKrlwwvoRyEOHXqR0UUFW8pr7U7i81cRi39jk2Uu4JOtfHcVxUvKJh4wsPsHs73RaUfkK57HvUZ050NFkjCh4fjp55wR1OeB8qGplsdJ856GKV1QXUdQNO4Q4MSFv/sqVjP3s6W1bvJRk2Va2zkMXG8EQqf2t2y9JRjTW/Gnbn2AxgCSAY8/D0SN27jluDTeYCBYnqeRWwUQg9dA3pgZUkIsBEcWhfxiGzj7ynjx9dEYJM/nrS10ByOu6YvA0WSA86wvv9p3ex741Rmxu7bWp2P3vP5Hxs2jDTnw3dU4cnWMyycP7dJ61nf7GefVJT/loaDJBWCQobuhZEAJL2W+Ym2cXVHfJLm22YAbE0xj0Vspxj4G1sP+cNwL/OyBKKJq7Rgg0T+EHElDyLIniEtJWkS1vFJRXKvKRljp/DyKIhd1dIbhO6KOkC0VzhcYPIxCyoeUCvJ5o=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB11799.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(19092799006)(366016)(23010399003)(376014)(4143699003)(10067099003)(11063799006)(56012099006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?JBGLX2ICA1d1vuuM9xaJrZnbDae1DsshWqjGS0pxfHPma3jhHbQCK31vKQUo?=
 =?us-ascii?Q?X+5J50PxeMyIVEmlJeQLn4gFHosSVHJsSHF0Bg/W2u5Orm8tXfUiPfdtfpbG?=
 =?us-ascii?Q?dsK5R5TPuRV8pVDH9lxOlTJcAb2F8+bXjGkMb9q4FZoBUEWB2zjd7DzDsHXu?=
 =?us-ascii?Q?YBqyeaRabKHPgSdHik6wUtZ+/lKkBOWUPF1t8SY/UOo/zgLt6lJC2YM9eNZn?=
 =?us-ascii?Q?WMAhvvj2DnnKbIlh2y6Vtb1RO2DebuhuRV6ThYZuIMwQOGosfS8YehKoyzF4?=
 =?us-ascii?Q?H0npLnSl94vAT69nPZmm+V8dA95MVzW/hva2bQJR2itZWeJ2WQ6kRI+9queQ?=
 =?us-ascii?Q?mtQx1hh5qTJG3CDyFZVoFLhEcdO+8N/heZ/q9MreAu1q146D+kYADymc3e1F?=
 =?us-ascii?Q?nSqhugAz47norcZwoJto4VEfiQVuPDXEnR3W04mV9UrMv4QMMGFeIS+DbIVo?=
 =?us-ascii?Q?4VJX2x8SRsgxx9CzTeoloN8ZOGObx1zsI8MLPUSItFi4e7h+OdOhAHPHga/s?=
 =?us-ascii?Q?ot8vZ2/5EvsqREPaXtFLX91CmBjP78QiC07QhFPUMGt8Vn3/xK2N3dwbMEnN?=
 =?us-ascii?Q?fxx2tR0aW4/0iJ+UFP4jn5bC4IQ1j4A2q4hQXTEtI662MZdd3WfFA3vAuQaM?=
 =?us-ascii?Q?oLlEgV69Az3biHKdVgNARmifEKDXcAOi3tE3RbXQsDCQE9Vo2dQgZGIhA8oR?=
 =?us-ascii?Q?d3Sph/Wclr7wNJHjlHofQU/S+6vWMSrW7zWLhQM5isOkWkbQ8jeUIQP4+yeb?=
 =?us-ascii?Q?TKq8Nc2O8s01A/oLKExNLjHHskJ2m+0U0f3Sp3hpb9OmqetA98zcHyu9/Ja1?=
 =?us-ascii?Q?JM2/aEbL+nqUHiMmTUv7pUEBVJH/bOtRAsnIIUe7xyPUrxkBesE0hN5hHnyY?=
 =?us-ascii?Q?f6kLNHh0GnwF7XmL7aKivBavaiLOo1NPtd2fuH3ASCst9KtWvrkqsF9Dza/E?=
 =?us-ascii?Q?j7rGt23/dnRTnnd+Kcl/gMdO79o02RtsDlEf/hwZiLfA62LIEZ4VcQq9he+2?=
 =?us-ascii?Q?d7KbT0uL/agzmzDYZ4CMcJffOj8pxZgeiHChkynC1GSkZUpKll1+fGSKS6Nx?=
 =?us-ascii?Q?EDhNDSSmCBfTXNd+J7gwQvDaCDkNeq+A2OQGoB7SEyJ3r6oAAGabRxfqBn89?=
 =?us-ascii?Q?TR444EvTgWgjyjr0DXCHSZRuCZFQEj3RKc7YLaBoNkquIPh/JuSCGF68aWY+?=
 =?us-ascii?Q?E+8sdyrvQ6XveV2ZhBQvRqsPzSjA8Ys5Z1AVllUf0W1L6BqiSe6my/UqCYe9?=
 =?us-ascii?Q?3c6kmPnZAsQyJZPHrI93SGbOXZb2o/CTTdkS99YO5FsVDEr/B40iPdAgi+Ht?=
 =?us-ascii?Q?/YaK3Hg9/xVK//2tO8K95NaL10BHgvjcw8NnJCuILoGzIvXGSHFvQL4+bBCD?=
 =?us-ascii?Q?QLu8Jm8T8lYfhkj3RyXlDE6y9zX/vKdaJjAxLqZ9CPMznqoo9lUS0sB3eFgZ?=
 =?us-ascii?Q?noUDJkxiWK0Mz9bbTg4IvjCUKYpyHi8wWDkx+T3qR24ncvs/sIV8QLfDd8j5?=
 =?us-ascii?Q?MYiTyMZb1jUpMHecfF6fTpX36h9eHGyLfpdq36FvMd9T7QDBRqwFvas3Jfg0?=
 =?us-ascii?Q?16KljanNyxN4pkd9jGfyVKzwZdh2sBofUCi7F3FUtuR78euKcNOPAos9+8K8?=
 =?us-ascii?Q?EIEKdpf3g9BuJ8SX8I30AXaZlaIEnBjnYflCCEjzo2/YTjZFjpRwpOGI4e4f?=
 =?us-ascii?Q?G5DzofkQekcSE58hpVBlC9BKpo08QAK+mq+3oRhvuJJsnL/jLru/a1ajQL9n?=
 =?us-ascii?Q?RRMgO8WzUI3A71KJ+ONXt0SNt4d7dwfMsApiDMUJqpg7feoWccgW?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7145ea29-e5af-4880-6ab9-08deecbe4380
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB11799.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 15:38:25.6348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: l2gwNf8Q4UZWmZupnNgoEbDSZiV7cbaHb8s95gMQabfYXZj0Phe6mV7YA1OYncq2g0Ca/ovVfVpHdvvkL9O5EshB6N+RtVR3NEr/ybyfmdMW1ennvSE8Sgy1KqXbQSLH
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB12038

On Tue, Jul 28, 2026 at 10:19:24AM +0200, Martin Kaiser wrote:
> Thus wrote sashiko-bot@kernel.org (sashiko-bot@kernel.org):
>
> > However, edma_writel() uses iowrite32() which assumes native CPU-endian
> > input:
>
> > drivers/dma/fsl-edma-common.h:edma_writel() {
>
> static inline void edma_writel(struct fsl_edma_engine *edma,
> 			       u32 val, void __iomem *addr)
>
> where val is always little-endian
>
> >     if (edma->big_endian)
>
> edma->big_endian is configured from a devicetree setting. It's possible that it
> doesn't match cpu endianness.
>
> Could we check __BYTE_ORDER__ instead (or additonally)?
>
>
> >         iowrite32be(val, addr);
> >     else
> >         iowrite32(val, addr);
>
> The potential endianness issue affects only the value that's written to the
> hardware. It's unrelated to the tracing patch that is reviewed here.
>
> >     trace_edma_writel(edma, addr, val);
>
> The value that's traced is always little-endian. We might have to use
> le32_to_cpu(val) in the trace event definition. But again, that would be a
> separate patch.
>
> May I ask that we put the sashiko comments asided and merge the trace event
> fix? (I'm happy to submit another patch for le32_to_cpu in the event.)

This is preexisting issue, which should not impact pick this patch. Just
wait for vinod to pick it.

It will be good if you send new patch to fix these preexisting problem.

Frank

>
> Thanks,
> Martin
