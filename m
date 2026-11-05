Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.73
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793868192;
	b=dtAUy8xS6Zs1tsHzBJQZ0T6IYDEhPZlwcdMgtXWX+l2fRWlOZKAJO7u8d0W0k9+/PeEG
	 OXZYQy4zRBp6KcuPFifiYQto9UdUSGbOz0ZDPK9bLT8BjJZBUnG/IDxcFuglEqt5LHQdK
	 I3G2chkRWCRLeBIEksdq48pYa8OaEUR+0CvfwiF81Fe4mUfMBUu3dyMVL+emSFFjj6nyq
	 XJOnmq9ifxhY+vAPb2OwOHZLMI68Dt5jfvWtmbvdRyUb71eRcjU4NCCLnCeJsTRHMmbEX
	 Yh339cRyTT8CXDp/zNSEULXUvLm+uf0tY7cDmR26TKzb7xUF9RJ5jmInfry3hJJX3tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868192;
	h=DMARC-Filter:Received:Received:X-MS-Exchange-Authentication-Results:
	 Received-SPF:Received:Received:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To:
	 X-EOPAttributedMessage:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-Id:
	 X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LTHKc7CPsmeSo4hSyJ5BPc4ouE6BkyRB//RTP1/HuOQ=;
	b=yE1XMhbA4TwXFY+8txaCX0muTRZkb+I01EGVqp5mG2/JRfceCuAAc5iVCsCZ39hiAHyv
	 7y5luMBLwTkApefPzoUcLGpt9s0DWy95cyWJEt72AADInHA458hKccn00QztZvblgnhgl
	 YdQlbIW2GL26GZI/6Dl1dq9RVVHWhQoivwG8KTn62lrSNkjCBLvkfCUEFz3b8/oFx8eK/
	 iBnQiAayrYCsCk6KhlqOywNCBim+bxlL4B5t3QWEXCOsMjYISp2lfYSoMPBZxzxU/rIqU
	 wWArGvxzHsStLBzzccaoaQi9gWqAOJ5B6g6JUB+naNm+IYFipWMYW4pgWSK5ed2+zFw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.73
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022073.outbound.protection.outlook.com [52.101.126.73])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4104E606A31B;
	Thu,  5 Nov 2026 08:43:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4104E606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RVtY8WB0k3Q2GBXEWEnZfaGS+73dX985q+mdvham4nPmhHtlhkbPh48+5Jw/HdJI1JtjnvYlApiocNGyNWShENDHIMCl1Ny9fKtplf7Qftb2vMeifx7ZRJp5nwcdAZ7ldfZgcwQ7bFgjzuSlUnHUEs0S4B6tzrd/zINPDWk4D1LG6f4MoEdbXihYqiLOTyE/M4fvsaTxtaq/A6jfn2dEIxpOK9JIeqm/M6k3O/0zDn8r7a4yChZya5gM/0+X88K9QvTiGK2aVSCmW4Cll2/dq3fakfCM8F7VTn62rbI143wRzo74pI4vrxD8vxHGDNiurXWO0z7Rh8DjLiszGz5Csw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTHKc7CPsmeSo4hSyJ5BPc4ouE6BkyRB//RTP1/HuOQ=;
 b=TUfbl0iisjr2Ol9E2yMI4z8w4JAN5Jdi6/IYm2QyUHi2i/Q+A2gQE0K4c9h2yzofI9pvLxfCoomhpnVCs9Qw2hbkIuQNjxgBlh6JMg35eukcbGLSLZv1YNQVDDPH6daw5nSpGz26CID12gtnxKi3I3S7KOOh/vjptqApA1BzVEfwONNnB07aBfVY1HVoDt+N3wlum/QiXa7eMRS/8dog1+WZ0nGLlTvninmIUH5G3K/JJne/6DPahh3Gk7AyrEYjtByd5jk2NGo9EgILPPEpxg7TtDVXf2STfrXq8bQ9mdynj113fLS5HIwZT8wzdR1cU9ZrXMuw5/QM/rPgOI0FHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=kernel.org smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from SI2PR02CA0033.apcprd02.prod.outlook.com (2603:1096:4:195::20)
 by KUXPR06MB9177.apcprd06.prod.outlook.com (2603:1096:d10:a2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.9; Thu, 5 Nov 2026
 08:43:00 +0000
Received: from OSA0EPF000000C7.apcprd02.prod.outlook.com
 (2603:1096:4:195:cafe::99) by SI2PR02CA0033.outlook.office365.com
 (2603:1096:4:195::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.592.10 via Frontend Transport; Thu, 5
 Nov 2026 08:43:00 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 OSA0EPF000000C7.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 08:42:59 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 55FB84102E60;
	Thu,  5 Nov 2026 16:42:58 +0800 (CST)
Date: Thu, 5 Nov 2026 16:42:57 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: sashiko-reviews@lists.linux.dev, devicetree@vger.kernel.org,
	dmaengine@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org,
	vkoul@kernel.org, Frank.Li@kernel.org
Subject: Re: [PATCH v5 2/5] dmaengine: arm-dma350: Add slave and cyclic
 transfer support
Message-ID: <auxBkRRHMaeN4wJq@ubuntu>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
 <20261104124411.296640-3-Jelly.Jia@cixtech.com>
 <sashiko-outbox-197326@kernel.org>
 <auuJKyC91CrYUAY1@SMW015318>
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auuJKyC91CrYUAY1@SMW015318>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSA0EPF000000C7:EE_|KUXPR06MB9177:EE_
X-MS-Office365-Filtering-Correlation-Id: bea5a1ec-42ca-42e8-59a1-08df3b18cc02
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|23010399003|1800799024|6133799003|10067099003|22082099003|18002099003|56012099006|4143699003|261026130827099003|261021135927099003|261022113327099003|261026135527099003|261022075727099003|261022115727099003|261022105027099003|261028144727099003|261021123027099003|261021121427099003|261021130227099003|261026140227099003|261021133027099003|261102123227099003|261026121527099003;
X-Microsoft-Antispam-Message-Info:
	BeyFqyeN+IOV2ORwcQtz2FOWhARFAGkvUGEmu6a24o1HWKFyuLcO13iQISc84pa1IpGHw8PoJ4HNehauwCqL6J9OUIWtq1+C+QOmp0JH8dJGUkNYSYm+VPDf5yMFvBC700qQetC2q+4pT+ArLx4hRIzpfHgbPkpfq3rNmPGLh/8d2/G3cKjETYzWRxNGXq048hQGCasmGh1jwWN8XkGkMlZZWvi0g95WPGnHB+e/6wS5GfvTh2mgZ45GZr946lZasBXM5yTjCesmYt0YOuMdOR26knNrPq0j6swHYFl9EFi3NOa2jZ7gpsvum6qE7Qdd3n3zsgiavDuRZvZk8w3LfKPLfI1qbwlVMj1foDZJWw/b1Xvqzu7kSyY0Lo/7m64q1mvIjna8yWbWdpZEPqkssEFlPsDM2XRRYn09akX/rZRcmWoZOwtuMs0pE8YG7od6uJXJ7AXkBd4Pb83PM4T5LpvCS6CHnDXFxNvigEbeIKsRf5Z9HeKocFQnVtZFp23K7361XRvoZPjyfSw8oBCF13FwXWEAph2/E6RGtcH87QeEXs0EETthmicgqDZ1CIi1jUsVluqBiutNSnOBug+yl2kB7aEibCpjfvRRXcyoAJouaXCAVPv7Kc1wrzryZQ1x2CaW3r6UTjE7f+9qV8Z18OjZj2aocuonEzn0mMncb0PhRh78hw75bhi0baJpIAGv
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(23010399003)(1800799024)(6133799003)(10067099003)(22082099003)(18002099003)(56012099006)(4143699003)(261026130827099003)(261021135927099003)(261022113327099003)(261026135527099003)(261022075727099003)(261022115727099003)(261022105027099003)(261028144727099003)(261021123027099003)(261021121427099003)(261021130227099003)(261026140227099003)(261021133027099003)(261102123227099003)(261026121527099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	GmhqVS+1hN0RmV1Ku7tcB8GXLVKpCTj28BQpWwz/ae3a9ViNIyB+PkbaG146+u4pVCRehufAyheSiM2EmMi53+5T+kzrgi3qZLqGbEb0FLCMqiGP35SKqBrLuPaqnV2mHk+uIW+dYKaPuLkqHeqT/9lLCF3iKTiyhm5XrsQmoeytkfPeLLyDsXHfgxTSsEjN8Xs1QdbqQBtWtJzuYhT8hZQ8mno93bR1HQrCiOZ+4PUkd2dZ9SxACbUTIH2RDoIUrSClRDMuM9PgrkOa/g8dkgWOuUi+1MP6OHhD9ivrlllWMIfWdPfhJioLCbCVioMyRwkU+OgbkrSPO6xPvmsfv/yAodGjq6u27ssjxya87SmaIXixmdn5gdK98FlLt4Mj4BYRVzKhR2ZQGuj7ORT6+C1Ypdc3vJvnnSiIs8Ls2qacKcZcMata45/6kXPfSb0U
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:42:59.5799
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bea5a1ec-42ca-42e8-59a1-08df3b18cc02
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	OSA0EPF000000C7.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KUXPR06MB9177

Hi Frank,

> Please check both issues.

I've checked both and made the following changes locally:

1. Initialize dch->req to U32_MAX, and reset it and clear dch->sconfig
   when channel resources are freed. This lets the existing request
   range check reject slave/cyclic preparation without a request
   assignment. Valid request line 0 and memcpy/memset remain unaffected.
   Request/configuration state is retained across terminate_all().

2. Keep clearing dch->desc on error, since the descriptor is handed to
   virt-dma for completion or termination. Instead, prevent
   d350_start_next() from starting another transfer while the channel
   is in DMA_ERROR. This preserves the failed cookie's status and
   residue until termination. Also reset the channel status in
   terminate_all() even when dch->desc is NULL, so the channel can be
   used again after termination and synchronization.

I've tested the updated tree on Sky1 and will include both fixes
in the next revision.

Best regards,
Jelly
