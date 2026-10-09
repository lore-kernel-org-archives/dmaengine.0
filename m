Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022087.outbound.protection.outlook.com [52.101.126.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C51893DA5B3;
	Fri,  9 Oct 2026 05:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.87
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791523169; cv=fail; b=DwEbdDNUYM6K2565htPL1jT5BVYcdoyZp9F/NReV1WRLpaK/aWmGzdL4pe3cBN6S1gu+9cxskvswFcTysLGdt4HRssNxySohi/WjZD51KeLtH0TXj12jpjGYTeNzL5xH5QPG5RV9cRZAkT/FS8cpUrzjpqVRRUR2u7dNoAe+apI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791523169; c=relaxed/simple;
	bh=sXDEutLsx5JPKBGFflEdVHczncQX03S0p9s6bWRyZ0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=R4IP0hh8lWcL/x8T4gIJkfLZdmmRDJ5wQt1Xsn8K+bOntmnmBc7KDG0NmCIhq6fL2I3mwQ3BfbEquEjhwC3j1CWD90jgSwVm8mGmFIZggquFvjLtrwYVpXuFo9jPzdqdgmy5N77XMFSxd/fUMAFJHqH9oZXqO30mIm6rppEToEo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=52.101.126.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CgcP3iNZ2DLzADQU15O8knSDH0yjymdhebP1Iqf0mPiUHEBpUNKkKAAjCmvRRpwUnMpRCpp1lvdKh7WdUGKnsBljBhUvuvNj0O26eX8zr9iNvmdB7hirYXVoSwjuDbEPyaze/D2i9niwOesUI6tomqWZ14CeBgNJmU9sYY/rtlab+r0KjB0mMaLHZ0kjq2wmwsHCq3AXp3OAOsXcJdAN/1oaPKkBBtDaSQm0OrZMEgSAxknxscYYpqSgesn583XKfYvAdW13DJiFxpYaIElT6aoHJz+Hv4sN81xQ5IKmhuLtbIk0SyiY3lP6jWMw6eZkYEyIveUWoTrlWEgO9YRTuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=R/wD7fGhEMx9rE6vx8duYf0Azu16jSKcs/hZKzss28s=;
 b=Z/ZhBJRcZuY+t5qH1J06ul7ZEJyZ9T77ranFg5n2VnZKlsfl7MbS/rnznyvslNVGFL8cpIK7mWMiOx3rNmfqp3Qqn/YyfyYRSyyFTbvWC8htpfx7jq6RdRGRUwAQSnW09U3B3ObdFsm8pi9dTLfdYOncIPZdEG2zZE0gVtGps7aVkoZMqwq14sHnjEd+20hu1si/h6kB8WlCJASIiDo6LVtr4P6pDmv5Wj6uAvDLkLJB4FsZSEi8xsuLqWnzkbPgvfXi584+vqQkwzGgJHCQSCAivonqK9qYWErIrQQB8ZE53HIsVbAHdBLvmY3/hgXVoicWIvSqNBMhvyw1lSYehA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from TYWPR01CA0011.jpnprd01.prod.outlook.com (2603:1096:400:a9::16)
 by TYUPR06MB6001.apcprd06.prod.outlook.com (2603:1096:400:351::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.496.17; Fri, 9 Oct
 2026 05:19:22 +0000
Received: from TY2PEPF0000AB85.apcprd03.prod.outlook.com
 (2603:1096:400:a9:cafe::65) by TYWPR01CA0011.outlook.office365.com
 (2603:1096:400:a9::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.496.5 via Frontend Transport; Fri, 9
 Oct 2026 05:19:22 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB85.mail.protection.outlook.com (10.167.253.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.522.6 via Frontend Transport; Fri, 9 Oct 2026 05:19:21 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 3C7EE40920F3;
	Fri,  9 Oct 2026 13:18:47 +0800 (CST)
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: vkoul@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	robin.murphy@arm.com
Cc: devicetree@vger.kernel.org,
	Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com,
	dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jelly.Jia@cixtech.com
Subject: [PATCH v2 1/6] dmaengine: arm-dma350: Fix source trigger bit
Date: Fri,  9 Oct 2026 13:18:41 +0800
Message-ID: <20261009051846.1115962-2-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
References: <20260907033404.596839-1-Jelly.Jia@cixtech.com>
 <20261009051846.1115962-1-Jelly.Jia@cixtech.com>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB85:EE_|TYUPR06MB6001:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 79d09d9d-6027-4a48-dec9-08df25c4e096
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|36860700016|7416014|1800799024|23010399003|6133799003|18002099003|22082099003|10067099003|4143699003|56012099006;
X-Microsoft-Antispam-Message-Info:
	srXVK/OoEu2zApi0rMCDJ0Fn7BGoWi+IsLfjIP4n398djohEyzIxVU9wceK/MUMwITYD7z8pkFgyeQwO5IufjE1WQPc+XMMHitUbsi6q5q2JTUEUzu7lCv+M1HfX+DUpHtlBXDA7OKzPMs5jL3D2v2siD6vbmGtxVusZMoEAaGBGkzuBJZMPVK3/lntVasnfkoeiuwBEWQ+nMZwi4gUAAQhBK9yAUQfXA4Wjqk6aVetg5JRQGPUaPmz0nWrDJlrESG6xRByteFr85G92kMlm/rqgWAHzuRr5QOReIfZnNWq/rIsXdjQS4XGK3Pys/+fK7f/umOyfeDhSEF93rdW1ixxmw5+CaolmSbULDgkcTLZGZLu9hjLjI+2sEG12UDLgBoUVXpvqYde0HQjQDILXnxyat9Ji9UJOfTYoLzh5SxjyZzILko4PXWLUDZcQo8bNrIWuFChqZvWbrjgA8fhtEaO8eTwU4Ii+ugYdiNSKZTcjbsglzLRlEE9lt9h2yiRXksmAl/CBgKXFPb2POxSSwkA5tFB+l/XVOZiWbVuAGZtUNCsyNDCadY04fRdz2DisU8edSeqWBiDa8dlKg1Y3SPtOIVL1FZjanguayHmzq7BNxq4uGA2iIE4xfg9zfNBL054KhPNuL5YsZzRMkkW33dpoqZUh4zWYUbXcaRZX0ksAImo17Pcr7wdrKW6WwHfYEwz6cGjfHSoUuoKpkoLnQA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700016)(7416014)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(10067099003)(4143699003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	dA6zHFf4DW8LMapwjf8XtnAxuTyVMxf8ei2o0g92Jmp38tK+nIhpbCRtSrYMepsg29i5CIdjk++z9SXDy+yNWoFFhCv30KgbZ4MXI/MsMYYECpt1Y8SPDBI5xK6RM9yJT2DAr2/MdJ45Zo+jm4TpNoGZv4jAIykKzaKmg2ccZ0I7BQ/Htqtv2LD4lxHMGBa633FFwwMk9ez1uNgTy2mFRJ4OsA6aJ29EM0CShIvnuJ9Uwu8G9jD36emIDEImzP7yQsd73nWGXjRl1HvOIQY/3bz3Olz8+8YplI/+nv5E3jDbmDoD4Ugk8gWgyaD2hETPpCSmtc6VYWBLTZ5kUGAQT07SHp14I9TFjw3hDKggkDchOvDWgSsLByDh3Op2bJ1E/f4NTGkAQ9FRjYqv056p10W8TcGRRihRumfXv6JThZN3VSV7gBnHKs6fSQ//buTz
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2026 05:19:21.9081
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 79d09d9d-6027-4a48-dec9-08df25c4e096
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB85.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6001

CH_CTRL_USESRCTRIGIN is the source trigger enable bit in CH_CTRL and
must use bit 25, not bit 26 which is the destination trigger enable bit
(CH_CTRL_USEDESTRIGIN).

The constant has no users yet, but enabling the source trigger input
would silently enable the destination trigger input instead, breaking
any transfer that waits for a peripheral request. Fix it before the
first user arrives.

Fixes: 5d099706449d ("dmaengine: Add Arm DMA-350 driver")
Assisted-by: LLM checkpatch sparse dt_binding_check dtbs_check
Signed-off-by: Jelly Jia <Jelly.Jia@cixtech.com>
---
 drivers/dma/arm-dma350.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/arm-dma350.c b/drivers/dma/arm-dma350.c
index 09403aca8bb0..4e17130de6c8 100644
--- a/drivers/dma/arm-dma350.c
+++ b/drivers/dma/arm-dma350.c
@@ -63,7 +63,7 @@
 
 #define CH_CTRL			0x0c
 #define CH_CTRL_USEDESTRIGIN	BIT(26)
-#define CH_CTRL_USESRCTRIGIN	BIT(26)
+#define CH_CTRL_USESRCTRIGIN	BIT(25)
 #define CH_CTRL_DONETYPE	GENMASK(23, 21)
 #define CH_CTRL_REGRELOADTYPE	GENMASK(20, 18)
 #define CH_CTRL_XTYPE		GENMASK(11, 9)
-- 
2.54.0

