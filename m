Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=52.101.72.57
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1792600679;
	b=ruQr2dbbv+W9caczam2yIUW7JweGSHJEVjsVlwfH6kbZeXngQcZOx/FDWJtoyh8RpfkK
	 /XhUZ4yLJGjUCeUjBLBsbCoJ9MyhyliQ/cJ31fRfHDHbOnOKl6tUXqG3ftKHKknHWwnnW
	 ZzfN1TqIbSpNsDiER+UqjiYckww+43zznh1ImFd7eVGQw+Y6yh4Iv7SIOv4nNAaL/o1PD
	 ciyxRxrfPsetpfIuN3dyZOL89xjJ4wHc1VrPU4Vn8ZFdW7b3+uaXR7Lw1UeyqBxsMFbL8
	 swGc6Pnk/iVKlPnIWNGoIXxbLXJEPMxJFM4to1th8V7G3gUZK4bXmvCIErcYeY+ikgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792600679;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=f8k2DjxEyqUaL9cGTocKFyj6UPD2f8risYrBO2Zps14=;
	b=4zr1zUhgY7FsEEpg4PV8Xu+JF714TRVlbL0vUZsgLWVJQxTAj7DzWJJosfOaqf/wRPAr
	 KyVFLqYEEpIE/Crb3JFApRQJssNKiep9aBbMNMIPK4+Rf/vw39dWFsDlDA8CWGCd9D+Ki
	 /eakI17KMPmklvnmOPP4KCEG8GOGT4QMOOjhUMa+DkyjLaSoxDPjgLFV9wuFF30ot05DY
	 ns8rce0qmsk1wwA7ft6QMg8lB3aBJvZUSrBz8OY4L2nlWsI7VXOFhKO8Kr/RghaHEGc/1
	 EOlUJdPTyL3JVNV8N+gwlFUotwyc1bYVtvblmuUDP+X8qTgnwjXobzAZHc6b793Or2A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=fail reason="signature verification failed" header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b="KQ26xcF/";
	arc=fail smtp.remote-ip=52.101.72.57
Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11013057.outbound.protection.outlook.com [52.101.72.57])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A06606A319;
	Wed, 21 Oct 2026 16:37:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 54A06606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=KQ26xcF/
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pwmW04zDFOwUCpT3cgJwrB96obFIKZSOTVjbWBL7RQS3DRBupmCr5kIM1Ql0ETVqzxykFIzTAT1jqJ75IhEbzkOZISeETh/rbHDzYQmskRlhuXM9enSICNrK9eiiIj25frRxMuUZF7YVlV4ApEjI0/vgXfnmYX7PAfrsVZKgpbHFaDrUG0GpET19bZVqK7IxTcnYNPkBN2rWYIdFDeXmAgT386i5ELB+llH1MjY5/5ItynrM6kJS8bjR4X+ADM2aRZHxnJvvmtjBKyVlFSHzB8SrDzHKOlg1Oerz6Koa+GLlGcKN4SaLEKwl7aRWUeiOzmsEp0M6xJRTP2XjwjwJgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KnsqBi+nIoInxmUsk2IlzZXoNsGJz441rkqgl6fGkPg=;
 b=Rwi8iDh1KUVie0VKCKCv9STiUnvnnp3FX8xL+gXMEnrg+Vg26pWNy06Uq9DDuAK2tHeA1nt/4yE0QvQs1rbjrIZLfq0xvS2R/KNiTch4SidmjvgOmy6FiA9OGGOZo+kjAOEIaogSehocudwXuf+yDTKHCHHQBijm5oCPUs87K51uJD7AD5lykzoRKH88xvhN3trjMEtbReALGismeg957xw32/R/s0txy+mO4isvM7CVmxsmgwU290KXqLPN3dGJdY6KcCxK/ni/eitMDsJ2muFmDuPfzTs5WOCS4z6e/BqIzt84e1BvD4CT7mLQPM2m6f0Jd9xYAVLeF74RXxB50w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KnsqBi+nIoInxmUsk2IlzZXoNsGJz441rkqgl6fGkPg=;
 b=KQ26xcF/JKvVHwuUHyQwgBwasUlQ+K4v9i8t4V6nMhl6XU2rpA0qF6dh4+UuQkv1bgmvcFdY3b+JMRh2/H9J4BVzjd1pzLyGitiuwf2lgP6cC0dG06gKjjD8hTk+4C/EOholQysrFPIMR2zPFobLAVvYyD2mb9CDhjAwuYkMI2x8WD7JXYgSn/tDyLPiKXviDUAqQuzIFY3+QaW3A4Cfjk50xTWGJrTBrEl+0vJNBHEOZhuPuAJKvdLi4fj/u6AphNqdlbyN96OLMu+HYwMQWp4rrAtzh5ywUG3XVtxULjJjO5zap7jW9QHePSxI4ALgSdY+vD90y1nCZtRN3zUSng==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AMBPR04MB12310.eurprd04.prod.outlook.com (2603:10a6:20b:723::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 16:37:55 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 16:37:55 +0000
Date: Wed, 21 Oct 2026 12:37:48 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: sashiko-reviews@lists.linux.dev
Cc: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
	robh@kernel.org, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, vkoul@kernel.org, Frank.Li@kernel.org,
	conor+dt@kernel.org
Subject: Re: [PATCH v9 2/4] dmaengine: qcom: gpi: Add lock/unlock TREs for
 multi-owner I2C transfers
Message-ID: <atjqXMg6-fLLYEsf@lizhi-Precision-Tower-5810>
References: <20260813140047.1006478-1-mukesh.savaliya@oss.qualcomm.com>
 <20260813140047.1006478-3-mukesh.savaliya@oss.qualcomm.com>
 <20260813141955.7466B1F000E9@smtp.kernel.org>
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260813141955.7466B1F000E9@smtp.kernel.org>
X-ClientProxiedBy: DS0PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:8:191::14) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AMBPR04MB12310:EE_
X-MS-Office365-Filtering-Correlation-Id: 28c602f5-b432-47b6-9650-08df2f91a870
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|366016|23010399003|376014|1800799024|6133799003|18002099003|10067099003|22082099003|4143699003|261013131602099003|261009223027099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info:
	xeDVqHfSw44FJDJtiXkEuNFhuXtIDACsJPJFXLEAfOTJzsJ2jxQP6SWL0mE1wqnK2+cDYJ6YoD+qLsN3TyoW1HE3BIiQEbMsctzcNxlQU/TGtQod7zK0aILlprpFOhE4iCJ9dZbMSs/3Ual5g1mk398TuPOgz1fcnkRahDMfxOw49QJVLCdReopvWs3oUCvneE1RyssOZGHkcZEIXSdT8OaGDGyQ3flUdzvQTWhBFJ70pcv6Xwxb5+nBaWPhHwed4ay6BVswWTAyZ3ODWcTk6Dv3dT7EHqS8BehCLeW6Q66alKVe1Yhh7/xMQzYY6FLOBDRY6jvY0LUkPj27sZ4gnJ0SjtQQtraF7H4+puZa06tNV7bmXnaUlC7/10x0ptY7ts4aH8/5vPO7z/Yi8TF+AV535QuLwCDSc2bK/G5P5cHjo8wRMW7ZKJuQHaALJdpOa9R67g0h5rQcqoL9A7lLW+7enj21eadaHTg2wHMN0AS4+oGhZ5ytsJe/Nw7VKn0d3Nz/zs0tiij6LyB4EpCp3GkwUJvXgzOiAmEjLftqlKc7z9QMw23LDl7jqnn1/Q3xR/zDc/JsnmY0d7Gz1b+I8AiHyBxHeiCxFw7L//zqjDI=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(366016)(23010399003)(376014)(1800799024)(6133799003)(18002099003)(10067099003)(22082099003)(4143699003)(261013131602099003)(261009223027099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?iso-8859-1?Q?4Pxev9DwH5WBPJRtKSuWZ5bxXvvq7siVdjaMk3aZcsrv1aaijAhHVElHNg?=
 =?iso-8859-1?Q?eSYALbMX2DX/eBl+rEhcTuTcvZbDvXpqnuOqDmBo5WTz5D/DFomyqkBB+0?=
 =?iso-8859-1?Q?wsTFJ6eBPmk4+VaewEtZjv6wt50CSkubkjd5uVwP2wrEkrb+d7yoKgMnQE?=
 =?iso-8859-1?Q?JgJspIzrbO8T5rO33Jmb0hQWE/St8IA1JEG0K0UrtHxhyhVujNhtKHXePx?=
 =?iso-8859-1?Q?8HISUVJEA7T2KXAw9ez/+m+aVV6VJUg96yBycrqhHRQN7AK9HOD4ogXDhw?=
 =?iso-8859-1?Q?gDm6wF8hzDHHuMEifrrlAbTjDsjT/Ok+Uo6jKfinItqzpWfKClrUOSKIjc?=
 =?iso-8859-1?Q?snmVftkc31pjdUKf1GMY05f7v6GsrkRob4VTPgJWqQZ2k2HVDCl1ptbYLb?=
 =?iso-8859-1?Q?F0emtjt/QxHJ/6YfDyP4oImGRRml4irJhM3CIMZDbyi7wL1inoDFZBuKRV?=
 =?iso-8859-1?Q?BgZqwkdX2lpSg8/6uc9+BVKOuxHLysTHuKA2MYQGc+n2Xc2Tcle51nO2Ko?=
 =?iso-8859-1?Q?+U7+sDkkX+fvra3TH6asG+MTfEZmyRxwiolfzGvteWyVuSHhoNik7i7LcJ?=
 =?iso-8859-1?Q?x5znquSW4O6vpJ9jdEjQvGW+/DghL8bryh5Y18eQHWK8Ecx78DEv2219cs?=
 =?iso-8859-1?Q?xPiKqh0p4Wrjkq7ak4CKAFmNrQ+ATM1lR5Rq5p4+As+qH8AwcsTWULzKFz?=
 =?iso-8859-1?Q?TDNX5o0DACcrYhu8MwVvViOgZyP/BkcY8Sv7rz6jzaEUDpzPwEpk6ksp3J?=
 =?iso-8859-1?Q?v6U2snmxHcoSGu+DgN70V41lMg9hGdNZH+hpr5WDTfTX0kmmY12c4ffIBT?=
 =?iso-8859-1?Q?p6fB5BHORjzPbeva4Bz1wrzv7EHn8/sl+ZpObaYGFMFTzG0QtdKtAqSTS9?=
 =?iso-8859-1?Q?8qSfnZlrVAfYzvaJNj4Rsxn7Y8T56ENAqn2NqIL/iAIcGoZRrAqYvR/bmT?=
 =?iso-8859-1?Q?9R0QhY9Bq5wgJPaZ5pYde+mvC0XCC2pZKNd1qFqfn72+LqSVeEMQIjX5pP?=
 =?iso-8859-1?Q?QcmtG5KZdwjVLx6TioyOdWN35GBEdQjrUk2g4WHz8SURTsdajz4MstZYoj?=
 =?iso-8859-1?Q?tFh7J1JNugOnyZ64kgvMWjpT8E9BhCr4e4pLmAyrZwbbYkRHcda7IcoCv2?=
 =?iso-8859-1?Q?TC4utm065vMOujsbZ7y8Qe3XPZKNUdNFBXht1uus/l8ozLCZJmz5u581aY?=
 =?iso-8859-1?Q?ueTHZ/KqVBmoVORbKU/B0LvQp4KppmnMthszzRUhVXF8sp9eEoxuDLW8Fw?=
 =?iso-8859-1?Q?gavDzK+xktici08TPR3CfBLIB8E8RUzQN2Z7ZIhtTWACuFByUOLn6ZJGZH?=
 =?iso-8859-1?Q?a3S9xt2Z/1K8H9zzwNNzhfXOKzPg8oVi/dKwkbFbFpLjxaM0maaz15jBsl?=
 =?iso-8859-1?Q?n0vw2u5ZOAWdJ6rptDkz1mqflogkX7ZBBeu6oWJ7tOUrQdICL1Yc0guLSN?=
 =?iso-8859-1?Q?fpTj1iqA4EeLL5AFjWLjeOWkPCRI2+74o11nWuzuicpj21fEXfrJj0ecDo?=
 =?iso-8859-1?Q?zY9eUQGmd4zUG4t0jRrsYfgyaD2WlcspfihojXYvXjSl2MTzyA0buNzbGS?=
 =?iso-8859-1?Q?Ke4GVUj7G6rG1qnpEqA3utOaSV7jY3yQ7XJKcRWE3HPmFAiMg1i8gVDlgw?=
 =?iso-8859-1?Q?BB95gquJksQadC4VzFOC5UP0fbI5Tp3WQnuqT+lu6wbxyydiOlDzjtatWN?=
 =?iso-8859-1?Q?bpCpAcFapo6xuW9ok+Dibg4EdRemojTo1VddrzF8ifgQM4SY1PSorOOmAe?=
 =?iso-8859-1?Q?cpgGp7DUI9t6TLSbcvIHpui+jDqPLf+wyDkaWv0Qzg+KfQi+I+FshBvgxB?=
 =?iso-8859-1?Q?bgXNp+wtPyvDimaAt7u2QtavmW259kfNHDWO2hMV7MDEHjm3C6Cz?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 28c602f5-b432-47b6-9650-08df2f91a870
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 16:37:55.3526
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: P9Hi+P2ZwPUT8IWEgJ9j1HZx1t0+hU3dwJ3loMrQsKxNCU7/R309YSwmpU71LG0EX+hLBfxx/XLrujTenvGaT06clOXZ7snZdpusLY4FkK/ba07u5zFBxSaxNMMPObrv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AMBPR04MB12310

On Thu, Aug 13, 2026 at 02:19:55PM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 5 potential issue(s) to consider:
>
> New issues:
> - [Critical] Setting `TRE_FLAGS_IEOB` on LOCK and UNLOCK TREs causes multiple completion events per descriptor, leading to Use-After-Free and queue corruption.
> - [High] The driver prematurely drops the hardware lock in Write-then-Read multi-message transfers due to misinterpreting `DMA_PREP_INTERRUPT`.
> - [High] Failure to reset `gchan->lock_pending` during channel reset or termination permanently bypasses hardware locking for subsequent transactions.
> - [High] `gpi_prep_slave_sg()` blindly hardcodes the maximum TRE requirement to 3, failing to account for the newly added LOCK and UNLOCK TREs, causing ring buffer overflow.

Need fix these issue or provide explain.

Frank

>
> Pre-existing issues:
> - [High] Dangling pointer in `gchan->config` leads to Use-After-Free during channel reallocation.
> --
>
> --- Patch [2]: [PATCH v9 2/4] dmaengine: qcom: gpi: Add lock/unlock TREs for multi-owner I2C transfers ---
> commit b6883d50c999f402ed4f7be119614262119be22d
> Author: Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>
>
> dmaengine: qcom: gpi: Add lock/unlock TREs for multi-owner I2C transfers
>
> This commit adds support for emitting lock and unlock Transfer Ring Elements
> (TREs) around I2C transfers on QUP-based controllers shared with other
> processors. The GPI driver autonomously determines the placement of these
> TREs based on transaction boundaries and latches a multi-owner flag during
> initial configuration.
>
> > diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> > index a5055a6273af6..25fe7410bee2e 100644
> > --- a/drivers/dma/qcom/gpi.c
> > +++ b/drivers/dma/qcom/gpi.c
>
> [ ... ]
>
> > @@ -518,7 +529,7 @@ struct gpii {
> >  	bool ieob_set;
> >  };
> >
> > -#define MAX_TRE 3
> > +#define MAX_TRE 5
>
> [Severity: High]
> While MAX_TRE is increased to 5 here, does gpi_prep_slave_sg() still
> hardcode the maximum TRE requirement to 3 when checking if the ring buffer
> has enough elements available via gpi_ring_num_elements_avail()?
>
> If the ring buffer only has 3 or 4 slots available, could this pass the
> check but fail to enqueue the remaining elements like the UNLOCK TRE,
> potentially locking the hardware bus?
>
> >  struct gpi_desc {
>
> [ ... ]
>
> > @@ -1617,6 +1629,17 @@ gpi_peripheral_config(struct dma_chan *chan, struct dma_slave_config *config)
> >  	gchan->config = new_config;
> >  	memcpy(gchan->config, config->peripheral_config, config->peripheral_size);
> >
>
> [Severity: High]
> This isn't a bug introduced by this patch, but when
> gpi_free_chan_resources() frees this memory with kfree(gchan->config), it
> leaves gchan->config as a dangling pointer.
>
> Since gchan elements are statically allocated arrays reused across DMA
> channel requests, if the channel is requested again, will this call to
> krealloc() receive the freed pointer and cause a slab use-after-free?
>
> > +	/*
> > +	 * Latch the multi_owner flag from the initial config call so the GPI
>
> [ ... ]
>
> > @@ -1627,10 +1650,33 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
> > +	/*
> > +	 * Insert a LOCK TRE before the first transfer of a multi-owner
> > +	 * transaction.  The GPI driver detects the transaction start
> > +	 * autonomously: if multi_owner is set and no lock has been issued
> > +	 * since the last unlock (lock_pending == false), this is the first
> > +	 * descriptor in a new transaction.
> > +	 */
> > +	if (chan->multi_owner && !chan->lock_pending) {
> > +		tre = &desc->tre[tre_idx];
> > +		tre_idx++;
> > +
> > +		tre->dword[0] = 0;
> > +		tre->dword[1] = 0;
> > +		tre->dword[2] = 0;
> > +		tre->dword[3] = u32_encode_bits(1, TRE_LOCK);
> > +		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOB);
>
> [Severity: Critical]
> Adding TRE_FLAGS_IEOB to the LOCK and UNLOCK TREs means a single transaction
> produces an EOB event (from Lock), an EOT event (from DMA), and another EOB
> event (from Unlock).
>
> In gpi_process_xfer_compl_event(), EOB events fall through to the success
> path which pops the active descriptor from gchan->vc and frees it. Since a
> single descriptor generates multiple events, could the event handler pop and
> free unrelated descriptors from the queue, causing a use-after-free?
>
> > +		tre->dword[3] |= u32_encode_bits(0, TRE_MINOR_TYPE);
> > +		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
> > +
> > +		chan->lock_pending = true;
>
> [Severity: High]
> If a transaction errors out after a LOCK TRE is generated and the client
> calls gpi_terminate_all() to abort the transfer, gchan->lock_pending is not
> reset to false.
>
> On the next transaction, will gpi_create_i2c_tre() evaluate lock_pending as
> true and skip inserting the necessary LOCK TRE, causing transactions to run
> on the shared bus without acquiring the hardware lock?
>
> > +	}
> > +
> >  	/* first create config tre if applicable */
> >  	if (i2c->set_config) {
>
> [ ... ]
>
> > @@ -1690,6 +1736,35 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>
> [ ... ]
>
> > +	/*
> > +	 * Insert an UNLOCK TRE after the last write transfer of a multi-owner
> > +	 * transaction.  DMA_PREP_INTERRUPT marks the final descriptor in the
> > +	 * batch; reads carry their own completion event so the unlock follows
> > +	 * the write leg of each read message.
> > +	 */
> > +	if (chan->multi_owner && is_last && i2c->op != I2C_READ) {
> > +		tre = &desc->tre[tre_idx];
> > +		tre_idx++;
> > +
> > +		tre->dword[0] = 0;
> > +		tre->dword[1] = 0;
> > +		tre->dword[2] = 0;
> > +		tre->dword[3] = u32_encode_bits(1, TRE_UNLOCK);
>
> [Severity: High]
> If the i2c-qcom-geni client driver executes Write-then-Read sequences by
> setting DMA_PREP_INTERRUPT on the write leg to wait for its completion, will
> this logic equate the flag with the absolute end of the I2C transaction?
>
> Could this prematurely append an UNLOCK TRE between the write and read,
> destroying the I2C bus stretch and allowing other owners to interleave
> transactions and corrupt the bus state?
>
> > +		tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOB);
> > +		tre->dword[3] |= u32_encode_bits(1, TRE_MINOR_TYPE);
> > +		tre->dword[3] |= u32_encode_bits(3, TRE_MAJOR_TYPE);
> > +
> > +		chan->lock_pending = false;
> >  	}
> >
> >  	for (i = 0; i < tre_idx; i++)
>
> --
> Sashiko AI review · https://sashiko.dev/#/patchset/20260813140047.1006478-1-mukesh.savaliya@oss.qualcomm.com?part=2
