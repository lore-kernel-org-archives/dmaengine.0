Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022123.outbound.protection.outlook.com [52.101.126.123])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA1D53D4112;
	Sun, 20 Sep 2026 05:15:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.123
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789881311; cv=fail; b=MDpSsCVh5/opjqwP1TXtHJRt0n1BgFyiB9+l3Xg3oSElI81hjCO9oX10iJxj6PnAbIE+4VLXRaaMf69EBb+e87vGW5K9HCdN/E6yws0OU6jC6BR8vx0dThKQNAZtYDNmWx4xwVTPSoSC5nFSiUkUFjZO/LNeqmP2PuNGZIkoz3Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789881311; c=relaxed/simple;
	bh=ylZ/CvgG3yh2HSIJShoIBFahkooqMR7/RY6zuzk8lgo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jtCivOwdVTgi12VRWYh2VB9iuFfizcEjyL10qAGKi5IXtjwV0JdKIpErubXS2k03+fVF7VX0Q45tEBw7iEUXASH3YigoKkdFoKFWk61f+dtntNZO2SAqfCwUuCkz+nup7L1CmWoLxs75AQec1eMerA+dE5y3ZVhPBRmewxwnrys=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.123
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8SPU5oAvtezlEd4woUcNkLHALbOsUJgdptDyX27GWCxQKPbAgC+WyPDXNJFWfJaKD/IPB7czGlDqmuLYvY16lX6Z63EjWvB2tadTw/DB+Ve/qVEBlDytIcK4zZSlKn0m6oo4Xav+eHBSXmMw0SOP6BcYdKemutbifiJpxKtHZdWf+cOJeTPi61TOHjd3J2Tiyxp1gH+VZeLWMFAIPFfx6wlRyBkEZ9XHqzj8tQ1VRIseHjeJoWTNqshxcDkC8kPeCZMKxuaIYNFInfQb3CjYlckCYybsJ4czNso96UG5MX8oeMrWwAgQvpOlm2u0jTQughEDf2HsjCtBmxojgACNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylZ/CvgG3yh2HSIJShoIBFahkooqMR7/RY6zuzk8lgo=;
 b=pxXgi3CxESXTde6BDP9bdo0xPDjvgOYLxLNwOLCmScwsOaz3VJAGjJHmj/Zb26QE26zwKFOQAiasENSpzOy4bbGI0ZP9iLrRfvpeQJK0EyNFGD78d241fORMG11pR9tlAicSC9KuCVKIzG9+/+xcbtpf3d2Wpv4BVsAfJplljS8MzLoI1v/Ksr6e7jInX2o9ihi8oLpkStfH/JDlpDBfs3VtX5PKsnGVnrRfZIYPrb8ZlRSdfFHQq642+ETE08Ka/T5u0Kt4cwQkGII0IfxzByVbN6EHF4LAiyUn3ITAkaYJ1ikt9rt2sV4bbHKgsxY2t8y/chYOVgmWgrIUWdEt2Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:7c::8) by
 JH0PR06MB6891.apcprd06.prod.outlook.com (2603:1096:990:51::10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.15; Sun, 20 Sep 2026 05:15:04 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:405:7c:cafe::6d) by TYCP286CA0356.outlook.office365.com
 (2603:1096:405:7c::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.15 via Frontend Transport; Sun,
 20 Sep 2026 05:15:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.451.8 via Frontend Transport; Sun, 20 Sep 2026 05:15:03 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id B587840920E2;
	Sun, 20 Sep 2026 13:15:01 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Conor Dooley <conor@kernel.org>
Cc: Jelly Jia <Jelly.Jia@cixtech.com>,
	vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	robin.murphy@arm.com,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 3/5] dt-bindings: dma: Add CIX Sky1 DMA-350 integration
Date: Sun, 20 Sep 2026 13:15:01 +0800
Message-ID: <20260920051501.3620794-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <aqE42NzerAiD2U1E@squawk>
References: <aqE42NzerAiD2U1E@squawk>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|JH0PR06MB6891:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: db941cae-d928-4856-80a4-08df16d6207e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|23010399003|7416014|376014|1800799024|36860700016|18002099003|22082099003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	OAJssUO5OBQLxSxysO2gjsA4HD70vatnsM/JWqqtcnGhYlgP27EBi9Ywp0Ou0QKHFObaSoFQb914F/9uMOGtX2xg3mIlnutcxnRf/S7HcadJ2lvz2b+BOULQ5YM8UkhFw1JKOvB8f7vY2eEdzuidSfLMrjTMr4+U27s4SY6SU0RunUoBUmzGVwGYSypxFIc0V+gq9JaJid8zoUcfV9N/nquhZFKQmzIF3hOcm/GK/kLug/WViwUXGvdZMBZ6cU4nTiwqwwUz+G7NqflZzzSw6m2MaJ0DiTsozct3LKHzS2PLII3L8Zu9e4EvqI3QMi6eZBrLiRxShB6WfNRgK9yyUIslYa2rT8hea5JI0Vg7p6soCWIPXxIX+UjaTAg1B5YDosIGlhde2BOYabFudaUOWn2gSXgZTVwi/TNNpiOYGfJwd3IOXwUQE7uPD8H0s7lJaE8H/iU13BhbMGIc70SRL5Ea/n3aUF+SjrC8Oc05ZFm8jTS/Dnyl3qr4ZSBphhhCMfT5FgueQph45VaroFVX4Tj9kTWJcPJqYRX9S79s8qW3X301N9ek1ZqR7iaHY1d8FSEeTrvdHQwgmOEIW3kv26/J+//hg+pAnSWGI7PCcdHkK7Hm2WjezlilICVvKOkEssLqa7/x5Lsgjg7FN2ojznzALT7pFseJWpmQWpGbKk+l18UpYWVh5Mvm6Un87BQ6+pf2u+r6W6gD8EkjUPjOgw==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(23010399003)(7416014)(376014)(1800799024)(36860700016)(18002099003)(22082099003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KowlSTKsSt9TJdAxFPtmIulOQxSk4H8krEHbIsvLX/3BxqqksLTr1ZNpAhVmdK8Dngu8n+h0JU2e0qwXJirROV1wGFMHfQpBVC+U69wxmyNbF4kS518dhvRfaKTdBpO+BwDqcqHLQ2sckcytkI7MOlskCJNhLeGi5qYf4eqoM5qnzRqPYqiD5mmiv+WLzDKPlyUWRaCgSoY2jDf+BhTq4KMsKQdpICNRATE3I8t7B+o9NqxZxrpyvdvzGh4VHjvschyzL3jBXhb6XBZuT0qPtY7WQQa/rYkmLsGc2R0UV4TRE7ux3J6/QWlVuTLvowjv2FswOnU0PY/j+ai+9E4GWZxVESqLgQorDxgWnN48UhyoTcYGXaG0kXDpt44DfNowj3XpK6uJVIns2ZvXvpENt+iJ0kN7eh5Y5uI8NWM8xZQeMsEqZSpHps69Y3VrihvI
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Sep 2026 05:15:03.1384
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db941cae-d928-4856-80a4-08df16d6207e
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6891

Hi Conor,

Thanks, understood: with the SoC-specific compatible scoping the
integration code, other platforms are unaffected either way.

For v2 my preference is to keep the wrapper, since it leaves the
generic arm-dma350 driver and its binding untouched. Does that work
for you, or would you rather see the dma-350 node itself carry a
device-specific compatible, with the clocks, resets and
memory-region described on it? I'd also like Robin's take on the
arm-dma350 side before restructuring that far.

Best regards,
Jelly
