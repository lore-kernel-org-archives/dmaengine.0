Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.63
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792532179;
	b=JXAZMAEYd+ux33zvRfGM14lcRh3TukifC6BM6xmeYVvF2z65JlJPIMua0p5mt3OYcoM1
	 /iuKCHtgYBb6Kyeh1ZHiAkZAEpYoOv+nLJz0lYUVMLgvJpocQvnIdOsHQxYPXVDv8sB4j
	 wftdNz8pFGwPUxWXWfTRnbeFo5PVDmjynPwRtYjj1SfwBkRBIsC64k3sL0leXym56nr5h
	 QtTgmryiVBtNQp1+QYozzz7mw6h7NGzj5ecBX2lnsBGrozTQskWNEJqKe0ureAESiSZTB
	 4jf5E5jvY6HZsBFVBDbUvmQl57tL1CS1D+eHC8/ZWx8nHgGMOjlEafCMUDDiFE7/ccQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792532179;
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
	bh=EPrx/qMb/c/4Nb0tUkKnfqwKmYVunMeDvQOrImGC94E=;
	b=SNEqVh2urYwHtjH1oUamGJ10Og+F/cKJl8nqfOCW3uvPBmFGENud4y1nNlPfse0UncoF
	 lFRnSHGhug4ZD/EKkc3Opx7N77nh9DNAw1HBfUXflrk/uh7jp4khOg53nl2gRpB7GGSrF
	 p4eA3PJvohg/kW2TLPPCYpRMP0uBzyYe3qDh5W/MbzHZRf2KG1ccIcPTfs9OuI4MO93GW
	 25MGUbc7577wB5CgJd/XPVn1T34Jm4zjhz91k4PFxMMENqgfnXnWUlaRItUetIhwCf5jQ
	 YX/6MOs9mDXrkjDoilGAjbWUqCYD410tzW19dXf4y+ez2q2/ID7sWFWKkFwmD0lNIXg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kkN7Rs3A;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.66.63
Received: from DUZPR83CU001.outbound.protection.outlook.com (mail-northeuropeazon11012063.outbound.protection.outlook.com [52.101.66.63])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD134606A31B;
	Tue, 20 Oct 2026 21:36:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD134606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=kkN7Rs3A
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y4ifubTepOkgiLYbJThhSni8YCFr/HYzyQxmmmWQ1pmq2TxiRk4xk84ha/fgm+ze1MiYLuY+41ViFiB+kZXu6OIU+IQrxBoywJF6yZu8/0nQ425jlfX+Ynp+rMYhCceZEY5ABRIHytc0oRr1P9KcuXbu+8uFNugwiaYUy/gm+1Hm1X8/sSGJfCJeg8IoZp9Bdvoo5Mljddu5N5b707Yymi+47As5kihjpvU0Dla5b/5NhrevG+XpbGEmD1zM07uuBwz6LQXof1zamBNq3Jv6yisnXZgicXbdAPH1gkjjDZKYCm2jJcF2yBFqEbN/ZTci3rcO/C0e+eILbQ4ll4e59A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPrx/qMb/c/4Nb0tUkKnfqwKmYVunMeDvQOrImGC94E=;
 b=VSFg2HBMuHYD/BINm6mJCHqOZVls4O7EBcfSQxiAoZIJv+k5QO8Pbf+OEgRKGLcCWzrDG/Ns9TtL8IZPwi+4Kh4wYIByPbUNh4akAdvaF6Z1MmrrnRaQXRafuyVJ7LY8cjiBWQOPlUkM948C9uf8l1/hh+InAJJYqXYoMAm7azU7BSY0iE5nShIKyFCFhexVGWrh8lFWQ7lCTMurY0HX13Dr6k1pz3ZfWKH47uCzgIOjYdB73Ti0/TcoXUlEKOqJm06MEQYQ/GLOX9Sio58q3RhDkTrzFU/wnrClKcViUe67V/a7rTwK9K8AbnNNemdVr6RDEo4yleA/cshE5HFYxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EPrx/qMb/c/4Nb0tUkKnfqwKmYVunMeDvQOrImGC94E=;
 b=kkN7Rs3AqCia2fYiaKw8/MA+WjfR7gpB11QMNV4V1N7Dydp+MVWvUsWS27ZnFU17kniNDN+B1rKzDZayRnFdvpg4ci6Z3gWoYq0OFxgB2m4yKQdkVoKogpBjOWJBx8dFPu9obpHfrIiEJbE1h4eN97Zr6w4gOhAl2kkteP8CzO3cLlTbAb43xC/B7PKJ/ssb7onkMi9e9gWyx/at0D9vmSBq26FtDxsV0NhxN8IfY1a39WAyiWBjnwLmsLyqA2iko6vNojqsLO/ICJWadTJNuaqL5C6tw1ueKcOuGSIOKJrYt53cWJKSYmwjWdsLULXdmohuku1WWjvORnY1oFKoEg==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com (2603:10a6:290:76::14)
 by AM9PR04MB8953.eurprd04.prod.outlook.com (2603:10a6:20b:408::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.14; Tue, 20 Oct
 2026 21:36:15 +0000
Received: from MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b]) by MI3PR04MB12438.eurprd04.prod.outlook.com
 ([fe80::c715:c32:8bb1:b70b%6]) with mapi id 15.21.0546.012; Tue, 20 Oct 2026
 21:36:15 +0000
Date: Tue, 20 Oct 2026 17:36:08 -0400
From: Frank Li <Frank.li@oss.nxp.com>
To: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
Cc: vkoul@kernel.org, dmaengine@vger.kernel.org, Frank.Li@kernel.org,
	andi.shyti@kernel.org, mukesh.savaliya@oss.qualcomm.com,
	naresh.maramaina@oss.qualcomm.com, aniket.randive@oss.qualcomm.com,
	linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dmaengine: qcom: gpi: Set IEOB on linked I2C GO TRE to
 retire TX descriptor
Message-ID: <atfeyHPnndVH-BSC@lizhi-Precision-Tower-5810>
References: <20260909175332.304767-1-sevanevorotov29@gmail.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909175332.304767-1-sevanevorotov29@gmail.com>
X-ClientProxiedBy: DS7PR03CA0351.namprd03.prod.outlook.com
 (2603:10b6:8:55::16) To MI3PR04MB12438.eurprd04.prod.outlook.com
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
X-MS-TrafficTypeDiagnostic: MI3PR04MB12438:EE_|AM9PR04MB8953:EE_
X-MS-Office365-Filtering-Correlation-Id: 836a76e0-48fd-4db2-d99d-08df2ef22b64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|19092799006|7416014|376014|1800799024|366016|18002099003|22082099003|3023799007|11063799006|261009223027099003|10067099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	wOO4hgHwe2VlX8FzQsExjC4KtR4W8X3yMyXat4WtrakTwio5TNZJPde4FYltVW7FvJCeZpUzmbpFvQaKU/0mGIUcABwMx0FflzrMRk5j1nPtolcpgbTEaVuZn9+8uY3TbfGUyADY/WMrIPhISXD2qF8qtibNOGRMdw2RecmxR5TqLDpQOPwWak8Dnksv3Y3M/JWZ5/LLT+GiuO8xy2QyuD1sSm5lk1DUimLX+YXvmzMdgSAKYQkw2ML1SFPGBMU2E9GFq03tSzchjQDjiz9DUS1zSA50P2JTMckDWtgJitM9xu3YRazs+8vywM4D/x9ghb7p99YxTevntFeLjrKFuXxqCV3cMXtO8mXIcJKD1ur/VNMR7JjlECI1ZSZvlbPg3iAEw8wHBywdsnYGXZc/K90EDmJxhaYrmYw8IL7c4GX2H7bEhZwu5fIIqmNa/Um4nVP2NIw3frqykh7EshcofJK/D4uEo8tBWcQkPVIvJ9Gzn1Dt576CJaE88LcZDjv3+3PSyQkWJs+k9bBB/PmMy67GjeMPZEicblegaNtt6pF9GKyR0p4MUIOggjfLqMxBuI8TBJpwQZ5wUOhSoZdPMU6gUrUbmFx/zM7FSprTVu+XmPfLqes/my+ccVTGtByJ0RhmtukaXMf58UqXR9U3q/5wB7by9g1LZhAJRq0FthY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MI3PR04MB12438.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(19092799006)(7416014)(376014)(1800799024)(366016)(18002099003)(22082099003)(3023799007)(11063799006)(261009223027099003)(10067099003)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kJW9WR+jOYuVCx0riAtVLieFe06Je3iCYJRRyXcQiKDxTTlodpVGQSYe262G?=
 =?us-ascii?Q?TGt2x7zZlS6LJJgd0EARQ2xrErpvClgLaTo9TU7yYtjdK4/Uu/xPdEgNRJVG?=
 =?us-ascii?Q?f+gNss9FKgQENEv3BvJE3h9Mtgww2emRKlwzr2+90EdNkIGf3o4uD/g16d3D?=
 =?us-ascii?Q?nE2UhjeQIqrUyjPVOh9BrmY/8mMu8nOevGi0zNhm27CQxUM6VZLtYoCkjMdY?=
 =?us-ascii?Q?o8mcoLCnB/pEPSxizgenE7mYf9BHz6ogxQ0X8CyDmxwOUVhHLptjXnbX7U8t?=
 =?us-ascii?Q?9J5FIxY30+SeJmaKn8YmznYfUqv16hG6ouRn3iJd/gn8vOOJFQjTg1p/Oyfb?=
 =?us-ascii?Q?qco3Q1TPH+5bUoBh+jRzuCM1zS+tgfmd49Gieg7R0nugWVCXDhy81ezIjN/Y?=
 =?us-ascii?Q?RACO58yXuh6dO+NddoahJVfLVojGhmOnMDEYHBW6lA4FRKm0dsCay+bpIf+n?=
 =?us-ascii?Q?k5BSe4CpESoY+/C755vpkuAmZ1L5cnzo162kS0Ndl9+ytf4je1USsPZ0ia+C?=
 =?us-ascii?Q?2+R/Is8yp68MZj7Akpi8aCFJ1OHtrFF+F9+ILDIs2IRdwE7tlGAZUTkC6Yne?=
 =?us-ascii?Q?ABIoY4zX9nVzv8o02tFfyHZtHvQifV2JvbbFkDg6q/bukn64E56wdVlrLunR?=
 =?us-ascii?Q?7VPXNlMHWQSzEcH9TsKX/7goukovkMbbBxpRgjUhqeJYVs8IknPJ6j3WIFpV?=
 =?us-ascii?Q?tZtaLQZVMG8Phb6hX2NZzKd9AftFt7AMQU66DrAPzRfqftZFv+NoK9Qjg8Rs?=
 =?us-ascii?Q?wfTKtakCDhCj6HiDjTi+PG5XNzOyQ8MFZvY+R5f6eN2TV0+3iM6wwM9Wzsos?=
 =?us-ascii?Q?+VpTYZfsTePFkiCY7kH6q2ArcdXJ1+4FBzHFyqSj1gjxtR4NMYOVT7yEnQP9?=
 =?us-ascii?Q?VK/hBRDSyiO9Ck7vkhpmhDgsK2x2oA+ymBbmyiKQiXb2tS3OZ3PEQEPaeru7?=
 =?us-ascii?Q?3Q2tMVxAH7qfMfGPEET4zS6Y+x7of2stNvXP7VlufaPpLHAS5aay+kFPnlpf?=
 =?us-ascii?Q?70XA2HIho1HHkfY0YFi8YTopuPO6kqC4oq398VyOWyqQgIBEz0F7RhMRzgfH?=
 =?us-ascii?Q?o7wNN0k9BzHBaylKTUQiQW7uBgcGSY+WxIRZaO/tshpD+fB9JJtmz0f3Ph1h?=
 =?us-ascii?Q?530Quj/vBZk5ytFzFdGwHMuKJ8bU9KP+voOup5ifl5L4xd0XWNHPM1T24l0l?=
 =?us-ascii?Q?jVvow5R7vJIE0NM4Bk0WZZrI83FyJgylhOcR18vsYXp5WYEqc0PiSqtAIbRw?=
 =?us-ascii?Q?LnKGl6sIFYsJK+X5kmzmEDuLwbcsqA2oCb24x/qfFgi1HTyhVeypJuUjDwoA?=
 =?us-ascii?Q?oX3dUrj6+91/gGGQfR2eAH0smA+ebvYeiNVS8jhkYXoOmfAXkiSHfdTKO9gA?=
 =?us-ascii?Q?1UjVZEaKM1nQeM4ScZhUW0jUiUtqfWJJ0+28apu3DVNnX2Rqe4xm6k4S9Xjt?=
 =?us-ascii?Q?6O5qFH5Xk3XwcIHlob6pMYG7c4pfovBMlzChVNswQiRjuwdvRv3HBOLeYP48?=
 =?us-ascii?Q?mFhIS8SAYAb1fn/anNClmtYIKsSPjVp37+iVM5iG5XRfcSq1Sy8psnxvSghh?=
 =?us-ascii?Q?vX1PAUV/dgCN1R0uW6TxAQABiLFI/iQ6jkYTLpmSBEvo2zNCuHB6iJZawUHY?=
 =?us-ascii?Q?XqMkscY+PbAP5O7IA3nK2yPCwHQ31woPv5UBRRSESgRzublu1eAan/exNrEy?=
 =?us-ascii?Q?0ay1DSmcYgELWOO7ySYC6P3dOw2OCz9N9Z/QfgzzCgI0iH59sc4LnpE81HQG?=
 =?us-ascii?Q?xRFo6BgJ09LDnhm3q7Pe4FllOK2bujIBycoT8pgBktcq8ng8sMpv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 836a76e0-48fd-4db2-d99d-08df2ef22b64
X-MS-Exchange-CrossTenant-AuthSource: MI3PR04MB12438.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Oct 2026 21:36:15.6009
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5bAxRLHlwYCamTB4zJRY961ul9Q7gHMMQXmbtscZpDxnUvf3rxJRAhZoNu2hazXhwwWstg67YIgwFFzhNJ0AkKShzF0qyd57OO4PNCapKsWp2ILHulvFd/sjJ1IkAhZu
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB8953

On Thu, Sep 10, 2026 at 12:53:32AM +0700, Vsevolod Nevorotov wrote:
> In GPI mode, an I2C read transaction consists of a command phase on the
> TX channel (issuing CONFIG0 and GO TREs) linked to a data phase on the RX
> channel (issuing the DMA TRE to receive data).
>
> Commit 656147fb1d4c ("i2c: qcom-geni: Avoid extra TX DMA TRE for single
> read message in GPI mode") avoided programming a dummy TX DMA TRE for read
> messages, leaving only the GO TRE on the TX channel with the TRE_FLAGS_LINK
> flag set.
>
> However, gpi_create_i2c_tre() did not set TRE_FLAGS_IEOB (Interrupt on End
> of Block) on the linked GO TRE. Because no TRE on the TX channel has an
> interrupt flag set, GSI hardware never generates a completion event on
> the TX channel when the GO command finishes. As a result, the TX transfer
> ring read pointer is never advanced and TX descriptors are never retired.
>
> Under sustained or high-frequency traffic (such as touchscreen controllers
> operating at 120-240 Hz), the TX transfer ring quickly runs out of slots:
>   gpi 900000.dma-controller: not enough space in ring, avail:1 required:3
>   geni_i2c 990000.i2c: prep_slave_sg failed
>   geni_i2c 990000.i2c: GPI transfer failed: -5
>
> Fix this properly by setting TRE_FLAGS_IEOB on the GO TRE when multi_msg
> is true (matching Qualcomm's hardware specification and the existing SPI
> implementation in gpi_create_spi_tre). When the hardware finishes executing
> the GO command block, it generates an MSM_GPI_TCE_EOB event on the TX
> channel. In gpi_process_xfer_compl_event(), handle MSM_GPI_TCE_EOB for
> linked I2C command descriptors without a subsequent TX DMA TRE by
> retiring the descriptor and updating the cookie without invoking the
> client callback, allowing the linked RX channel's DMA completion
> (MSM_GPI_TCE_EOT) to signal final transfer completion to the client.
> Other EOB events fall through to the default transfer completion path.
>
> Fixes: 656147fb1d4c ("i2c: qcom-geni: Avoid extra TX DMA TRE for single read message in GPI mode")
> Signed-off-by: Vsevolod Nevorotov <sevanevorotov29@gmail.com>
> ---

Reviewed-by: Frank Li <Frank.Li@nxp.com>

>  drivers/dma/qcom/gpi.c | 13 +++++++++++--
>  1 file changed, 11 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/dma/qcom/gpi.c b/drivers/dma/qcom/gpi.c
> index a5055a6273a..a1ab63bf9f6 100644
> --- a/drivers/dma/qcom/gpi.c
> +++ b/drivers/dma/qcom/gpi.c
> @@ -1050,6 +1050,13 @@ static void gpi_process_xfer_compl_event(struct gchan *gchan,
>  			return;
>  	}
>
> +	if (compl_event->code == MSM_GPI_TCE_EOB &&
> +	    gchan->protocol == QCOM_GPI_I2C &&
> +	    (gpi_desc->tre[gpi_desc->num_tre - 1].dword[3] & TRE_FLAGS_LINK)) {
> +		dma_cookie_complete(&vd->tx);
> +		goto gpi_free_desc;
> +	}
> +
>  	if (compl_event->code == MSM_GPI_TCE_UNEXP_ERR) {
>  		dev_err(gpii->gpi_dev->dev, "Error in Transaction\n");
>  		result.result = DMA_TRANS_ABORTED;
> @@ -1668,10 +1675,12 @@ static int gpi_create_i2c_tre(struct gchan *chan, struct gpi_desc *desc,
>
>  		tre->dword[3] = u32_encode_bits(TRE_TYPE_GO, TRE_FLAGS_TYPE);
>
> -		if (i2c->multi_msg)
> +		if (i2c->multi_msg) {
> +			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_IEOB);
>  			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_LINK);
> -		else
> +		} else {
>  			tre->dword[3] |= u32_encode_bits(1, TRE_FLAGS_CHAIN);
> +		}
>  	}
>
>  	if (i2c->op == I2C_READ || i2c->multi_msg == false) {
> --
> 2.55.0
>
