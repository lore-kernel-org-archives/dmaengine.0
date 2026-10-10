Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023100.outbound.protection.outlook.com [52.101.127.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6988654705E;
	Sat, 10 Oct 2026 10:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.100
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791627760; cv=fail; b=MintqurAQM/aT39HJ8UZFdCSTOnmSK6/7uKdP8wwGxPO7QMmcy2w9yvyrQwxk1ZRenTHMKwxeh2/YtFI/bwAvpVfhBS6odi4tIyKtGWogvJY9SB4PkJ+J3y0kJm5C3PONuA7ejtwoPpwmshAiYL4suV2gidKgKMOqI1yQZnw25E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791627760; c=relaxed/simple;
	bh=rmTN6ZZHtSaW8/a8Be5oCWUWsMJ8C/QHB5Q5Keo/lvw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=A9w140lXYr07Fr3JPdxID6L4ArmtWOmcobCeXqTqcnfTG0Uc/l3j2bUlboHL4U8zD/SrrBFrFf0Gzd78mbBTkxGYViaGBSnEqphuSo952Zh1Cg4rPl0dxo1zBcPaCRzOzkZHxybz1s0jMDmRg4SCxOFIxcbxw5YBhLDv5/vsPrE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.127.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kw/caWPhLsrQA8RNFOgUY7W2NfiCnFz9+0udOO3RwS/fsoNHHGGbHwmjaP/FNN1pxSxET8DMvFpE/DtQBq0FiDAqyttQ566cdb3b3I0ZQitee3aOk6swwL5EhcfwVsa8IrtfsPmzd3MxRzaX7vW0YCuHWbQNUQM9fRKeIcR1VzgcQ20Pw737r7yAgMPGcOdHvDOeXMcA1Ti+A/py9BXwW8U5SeYFtMPsnlI3ucwdu65es9wWzH3HBnkOQChce2KyqAB0gnJS5uSmyBoschq/im7CfnHINnWLmbbHoUgmqZ3SqcPCqTh+GElhFxJZv3wTtxESvTOmarGDGGvANyXOMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=s1xhQvFE+tTixDaGsTMjUmHYpIkW5fHQ1qLxvap/Qmo=;
 b=zFSqzWbPPw/Sf6E8ar77LNfoa70i8bC38fyURDB62ktOldHaIcc1x1xY4njI+9PixdyiRNYXvDsmD/Xldk1GMEQvsmvCT4CipeJKGbWBQBt2l/3jfy+tX4q6OPiBClVgOupC/2/ghh4P85xfhe+SOet54mtY87q13jjPQ3NvNRY955Nue1X18ibuIXNsqrtm88m/d5miYImPF+UhlCHA4+deUEa3GR1j6GMEzMUXH5q3JAAD9q1roU0kLa4ffR19rvpcemuy2PLs8ehlBpWmGJSYR4iSQitkMxefJ9Er6XgnvRCvBpR619OHg7bVwX7/DUw2Ppn9pgIY8aXXyDRPxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TY4P286CA0094.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:369::13)
 by OSNPR06MB8568.apcprd06.prod.outlook.com (2603:1096:604:490::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.19; Sat, 10 Oct
 2026 10:22:34 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:405:369:cafe::49) by TY4P286CA0094.outlook.office365.com
 (2603:1096:405:369::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Sat, 10
 Oct 2026 10:22:34 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Sat, 10 Oct 2026 10:22:33 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6D3FD427E3A0;
	Sat, 10 Oct 2026 18:22:31 +0800 (CST)
Date: Sat, 10 Oct 2026 18:22:30 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Conor Dooley <conor@kernel.org>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] dmaengine: arm-dma350: Add CIX Sky1 integration
 support
Message-ID: <asoR5in8YVJ4Q/qe@ubuntu>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-6-Jelly.Jia@cixtech.com>
 <20261009-9c6b706f0d1a46183205dd08@squawk>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009-9c6b706f0d1a46183205dd08@squawk>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|OSNPR06MB8568:EE_
X-MS-Office365-Filtering-Correlation-Id: 23807809-ed17-4b83-5746-08df26b8661c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|1800799024|23010399003|82310400026|36860700016|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	czx/7yVhEtFZRieA2DJV7yfPfcXe8MBvnbBaLkkx142wSqIkGBlNLzzRVARORmpTFYrvW5shlDL4l6D7HWqLTM4lk0M6ezQ0vSzLG+mv9tXLnTw0VXtV1p2eKsPGwns3uePcFqbbiGe6sRLDPju14R+vW5vUmYuPkw1qu5Yb2kBmr059/6K6eNM9120z9Si6U0BxmqHcxxjdHi3y4qOmwyMzD0X1EmVDcBhtjLSI308scRlDpgsmp4NU8HTEpMd8yA4eG09C0jC28sKs6HBrYxedTsQ+KuMrtfI5JU11cIoBmQ1NH7k1KsT9Glcur+fAEJLnxnqA1vyxaq0nf7sfPB49tAv5UtwQ9OBeCtgcPW0YyxExXwWoBqZrMPz9nHNZJmRPP3h+TXzSljczljIcxdF1f+WIQ1lQIr+d+2H/2L4XZeY+5KQ76dD1X6oe+Ou++wLCuBhCgMyQGUiajn1o9FZ8BCkj6d57hhX2kj9/XcxeVjoOCL8V+ILEuHGteALNxqN4eJBlH7cSxUFjZn7o4Ul1xBEX1uLwF8KiiFvrtOmP3AsG8xZOwldTDxmFSlOVAmf6Iftg4+poHAUOIpiB3wReff0jSf0hR8TpNVStgiEpJwnD23bN5o826f0cIgiCMHXZTb94719U1rQDNFphxFXnSg+2k8JVQvYySint+Z7aHEYAGc83Cerhy4/atbaNOtNbN46vKHDz1Rf+pPSXJA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(23010399003)(82310400026)(36860700016)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	lEPh3qjW2LUkMgd9DMx9g14YqpTbUdrHoKdKp1bWdNKZihGPuTw2dlVjiHuJx0EpzmM5zrYK885g1r8S0fpZSmq7gdEWBs+uml/Ntgqf6mKDZ0nKy+3xuA5W4xUEG/zozM+EBpn+CJLR+yZI6YNk/vpJvPHFMb4Y5H+ZFrCsmYAPYhI9/6kC5dVpNe5sw3EArD2+X/UXs3SOJWagmH9y98cUkyBV2OlTeoLTrdzFZsfAL3GiDtzOhJ8K3eEineLSfRgH9DlBFsj+wLC5X7TePDuahKnKQwZR8V3jSXvWkV6C0X8Dslzbo+gyJYAh5IgaifwyWDk5LJPqt19p6yka52KoKj18obuWzA9z5uNGrewTTU5xXyyS/gY/A/nKmCiEWGRgYThlJImkvGExovEjchqDv6AAxdkdRt0aZSzMF9i0TnK+F1oWXuSFd4SPGs4r
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Oct 2026 10:22:33.6585
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 23807809-ed17-4b83-5746-08df26b8661c
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8568

On Fri, Oct 09, 2026 at 04:29:57PM +0100, Conor Dooley wrote:
> struct d350_data {
> 	u32 irq_route_reg;
> 	u32 irq_route_mask;
>
> Since this is a fixed value, there's little point having it as part of
> your match data. Ditto the reg value, for the same reason. The user is
> called directly from your probe code, so you can use the defines
> directly.
>
> That said, should you actually be doing this from here? It feels like
> a bit of a problem with abstractions where you're fiddling with another
> device. Syscon stuff is okay when you're changing something internal to
> your device's functionality or something "downstream" of your device -
> between you and the output pins. But this is something "upstream" of our
> device and I dunno if this is the right way to do it. If you need to set
> some sort of interrupt routing, should you actually do something like
> microchip,mpfs-irqmux or renesas,rzn1-gpioirqmux and preserve the
> abstraction/separation between devices?
>
> Cheers,
> Conor.

Agreed on both points. We plan to handle the interrupt gate as
firmware/pre-Linux platform setup for v3, so the upstream DMA driver
will not program it. The v3 I am preparing removes all of this from the
upstream DMA driver:

- the cix,irq-router syscon lookup and the routing write in probe
- the d350_data match data with the route register and mask
- the d350_route_irqs() helper and the resume_noirq hook that re-applied
  the routing after system resume
- the MFD_SYSCON select that this pulled in

What remains in the driver is only the integration of the DMA controller
itself: the clock and the reset, plus the address translation that is
described by the dma-ranges of the parent bus node and applied through
the DMA API. The driver no longer reaches into anything outside its own
node.

Best regards,
Jelly
