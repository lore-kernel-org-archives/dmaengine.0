Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022077.outbound.protection.outlook.com [52.101.126.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE8C285068;
	Mon, 20 Jul 2026 02:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.77
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784513943; cv=fail; b=YmWmbvQijx9RVBt++DZM8tDIWuQHS9fUvLuXo6KQnzKaW2aoqF1jRSXON2UoBwz3qLWgS7D6nSziJ6F2uFjyzMh6W/yfvDN0mm5wLpaYC/T62ujvHvrHPfq2JffP4GIPQHbRhEhRhKRZEsck2nGqZyJlZLRq1gPur8QX92+P2R0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784513943; c=relaxed/simple;
	bh=5VynYqI65faapwkyxVy57GNHv1bJiumzX7T9JLPvxD8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTOBMJjC/5Yjtm4BLsfPs2p61j2EcWdnANvI8auSDFyW8VtUtcGgLZcrgZyC+m7/Jceo9aHGAKLAB0cal1Zgser+W8FBHQdCByK7pBLFHAEQCf4lNwJkxPQbY7mDUPisWIIYr2J9vqUkaKSM3U44uV4H+F1vX9PdD7Td56Qgr/c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BJpYzvo1wQMPRXKv178X1XpRnoP69DpNa7NoGsDPfAW2L/GwlenEoI6FHyZAFEfje/aYzCDQT/lIv8gJEaeToBhXMXP3LwHHGXXD6BvXhIZN5Ipiot78FiCm1Axds1qFqJ40yxRUd1MuoJ0Mez4XBdqhvYKSu6DKmaXktO96JmhW0taIRYsT+dB4tZ68mg2e1ZjASc7LbN4HkZPb9i5HMI1bOT5pM5CLD/sZkN/GgOoMy7VyOoD2SrKbUTINcKaS3YWURq48xcLhYE8Jcs9Ph11bIUZRDoK83FQweqj6qxExH4iATs5E06xGLnGiCxhcnaj97jMqYMCIAw6uxhPoSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D0cjbw8xu5+Z/tmj8JvDYlb8QuZoN/PtIKYOZC06SIs=;
 b=IoF3CWPWFHlQb/XR5vkf9i5WGwet03OfCTrAgKoAm1FbjOK3HDmyQJ+7SmFMzxdo9clXjoQVixX0hinVgWLWpakQ8ZNSlotZV/P40tDSV6mhnsCBY0sxL8TUA/fBi9tlg++MLNShlGd1ubwBNnwkloiiAA2jgmtPnnyAcsT769bfJ5w9aCfkk7/Vdy2zv0IspxXJdoYSRDPzaXRYE5+3sIrN3f857up+P05Zn5fWBxFgdAkyYTSlA0V6zf0BB2lA/Ct1zdsGwrddT7ArSG2DqnI7wY9N9NN6W47g7TK3C1GWvZckoyYUBkg/aUgxnh9Kk0Pbxvcx9La895bkHyipvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0017.apcprd01.prod.exchangelabs.com
 (2603:1096:300:2d::29) by TYZPR06MB7117.apcprd06.prod.outlook.com
 (2603:1096:405:b6::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.16; Mon, 20 Jul
 2026 02:18:56 +0000
Received: from TY2PEPF0000AB83.apcprd03.prod.outlook.com
 (2603:1096:300:2d:cafe::43) by PS2PR01CA0017.outlook.office365.com
 (2603:1096:300:2d::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.223.16 via Frontend Transport; Mon,
 20 Jul 2026 02:18:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB83.mail.protection.outlook.com (10.167.253.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.5 via Frontend Transport; Mon, 20 Jul 2026 02:18:55 +0000
Received: from gary-System-Product-Name (unknown [172.16.64.196])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 8F86F427CEF1;
	Mon, 20 Jul 2026 10:18:54 +0800 (CST)
Date: Mon, 20 Jul 2026 10:18:36 +0800
From: Gary Yang <gary.yang@cixtech.com>
To: Jun Guo <jun.guo@cixtech.com>
Cc: <peter.chen@cixtech.com>, <fugang.duan@cixtech.com>, <robh@kernel.org>,
	<krzk+dt@kernel.org>, <conor+dt@kernel.org>, <vkoul@kernel.org>,
	<ychuang3@nuvoton.com>, <schung@nuvoton.com>,
	<robin.murphy@arm.com>, <Frank.Li@kernel.org>,
	<dmaengine@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <cix-kernel-upstream@cixtech.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v7 2/2] arm64: dts: cix: add sky1 DMA-350 node with
 channel IRQ entries
Message-ID: <al2FfGPKCukLbDIx@gary-System-Product-Name>
References: <20260521072924.3000282-1-jun.guo@cixtech.com>
 <20260521072924.3000282-3-jun.guo@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260521072924.3000282-3-jun.guo@cixtech.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB83:EE_|TYZPR06MB7117:EE_
X-MS-Office365-Filtering-Correlation-Id: dc993f25-3e22-4203-86b4-08dee605404e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|376014|7416014|82310400026|23010399003|1800799024|22082099003|18002099003|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	M21fiyjCctvo3y62TLIrYf+hoM/iJgLKNvZ3odWYjzhZlOs5HAiRVAnPFg9Kt9XzWwBHwiw+Epo9WXT0D7in6zZBN4eBfUcaF4mtrfDxlcn8Zg+OZn8o5ejbb24La0RxxKj4B5urXuftwmZIxRCbtqNl5edResr4uKEKs2m1SmbmFEpLdJO5u4q9BAErGx293SOI5h1h26V7szWSZyCttfy2wQRButOXHLxiW0ZJMVG6M+Uc/zrtfJXCmJa1xRHUmMNvIFw34d1coMQVgXHReKmUKwIvEfRthFC/mhujLryd6HnFxyL3GuFYqbCcDSaSvHVIDbHcNcRcEkKj0V9krbYJ3a1/dO/h/IKRff8dLTKudQZ3GrJwEpI6O+xgLSdbzfGbK9Y+A33RlyMFx9oAtCUABBPjUIHK+MPCTtjSolsOJIGBMExlf/BW7PBOoM5tSR8B9XTqRyCjOu5dmcrAY84drz2znaZEhTuEicvhUN5osz/U9g8GdwSovheRHHRmY82BUb3ZPCf+T4tI7UpGo+4O4lOBRJQuW8sbnzYlxwj7+jKo8DIOY1njTmputW1njYMDnqL8xFIb6/cYZ5vu1HpNsJo8MyCmpZayklpIKu5W8N/9ohyz6U0SmrDPY4Bdu8AkzQdcEwfHotlMdiw5zHFBud/AbV+UJJjdAS6HFpx3xXPjoSQZ0bJVSuAzoEFdxpz6bvag9Be2y3twW2lNzw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(376014)(7416014)(82310400026)(23010399003)(1800799024)(22082099003)(18002099003)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zHsDDLkRzQ2lJ5A13y0C3h653N0lytCO3AO5qg1H3CsrZg5hT7pWtC0lSPmcWQCBsk//Yw1PvhituPJWBgWfe6yOT1crbZbHgt2giwTaaaibFWc8N8O0BVom1vQjIuU6czuQeA3/7vpZV63mlXluUu70lL8R18y3xd3c8K/NMdacmGpc9FQUSRFk739wweL9flzJp8j8uEy349d5Il4u9QhsAAF9y2NFuXV9bYg1am3CkdVcs1rma+tWPx8O8PU622yd2+ZocyKEuZyb8LrVPhbrK/i1QIznx5f8CjUixzmBQgBSSXYzSLiIRVkkgpvUoKd0B4Ye82XXkDsIvGcwxSZW79ZNH1ZFkrUNLctSIZ9w1/k0ooHXtny66lw9bWwWF6qwOAF1mxoXhReSuaRAmZUFSg8unPvmHbkWxhnP8F3UBil0sUisUfwiWhRhkcNl
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jul 2026 02:18:55.8560
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dc993f25-3e22-4203-86b4-08dee605404e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB83.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB7117

On 2026-05-21 15:29, Jun Guo wrote:

> Describe the DMA-350 channel interrupt sources in DT using 8
> interrupt entries, while all entries map to the same GIC SPI
> as wired on this platform.
> 
> Signed-off-by: Jun Guo <jun.guo@cixtech.com>

Applied, thanks!

Gary
> ---
>  arch/arm64/boot/dts/cix/sky1.dtsi | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> index bb5cfb1f2113..823adeef51f1 100644
> --- a/arch/arm64/boot/dts/cix/sky1.dtsi
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -444,6 +444,20 @@ iomuxc: pinctrl@4170000 {
>  			reg = <0x0 0x04170000 0x0 0x1000>;
>  		};
>  
> +		fch_dmac: dma-controller@4190000 {
> +			compatible = "arm,dma-350";
> +			reg = <0x0 0x4190000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>,
> +				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH 0>;
> +			#dma-cells = <1>;
> +		};
> +
>  		mbox_ap2se: mailbox@5060000 {
>  			compatible = "cix,sky1-mbox";
>  			reg = <0x0 0x05060000 0x0 0x10000>;
> -- 
> 2.34.1
> 
