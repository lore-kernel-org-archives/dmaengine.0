Received: from SEYPR02CU001.outbound.protection.outlook.com (mail-koreacentralazon11023081.outbound.protection.outlook.com [40.107.44.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B3CC30E853;
	Wed,  9 Sep 2026 06:05:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.44.81
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788933923; cv=fail; b=kK8FugzQ+W/9fdWrG4k7WOs1dE2h/uY9xNsww+Y7oKVtPbkMPgo9BEhfhhw5pumiBLxXpL0WE6O+GxKV2bFqWlVld1xfZKbv5+UMd+070tkaBbbbv2Q32Y/y9g04mEHxoQHFn2W9OOmLh+jGA0+Z/4otuqfToZa9yQ9mWCtMdRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788933923; c=relaxed/simple;
	bh=LTZJrg6NMzQjugQPES41WwrbE57dIMMtvubE6DFeH70=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=EyP7nXcpRAFE075lJmmYITvQQs7ARmo6x1/wx6F6vyTZX/HteiNIjFxS9O1FTJbn7aHOWt+wYSV3Dr1LNfu9gxqI7NwdB6nhFsYl6k4pkr0XDaeTbl1Qqd9ir6Eb1PCBSEokWbuP88IUlrnPeLb+rtRv1QuuMqtAj2B/umHhiOs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com; spf=pass smtp.mailfrom=cixtech.com; arc=fail smtp.client-ip=40.107.44.81
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JFVHd+3njVVRK4988RkxfejppApCwCjUy7f+RpdnzGBZVBxmYlio9+UKxIFlBx8QQFAozPkTzqurbCuyw86u+BhjUrdfD2luvEQJDwhGQcHSKN7SeezTNrjWEXiMcMthxqruOIO+/gNNPl8CJOxfHcc+LsnmFjEhHjtVFGpDXAJeHLnbtRag16P+YZKRBZp7KL+hfaaEs8/PmYq29GfWbmACoN4NBiW8mwRKDCet+1b2WlNQEsyhyB7JxABCT5vNdarFUjKoAeDutxexAnXfuZz7EwbtbBiedGrUNgnvOxQNjQrGST1Q/MtvriW/nKGukMkjpSnIxU8bEskoCIJjBA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LTZJrg6NMzQjugQPES41WwrbE57dIMMtvubE6DFeH70=;
 b=EtzuyUetTSw+Lpmmz+wb7+kq9eKgnuYXuvGrBP5/kOaPxk54X1mG3OAeaMNvxntAc1R9cgxJKJeCJOZH2Ek2LRWGQz0ydNTy39ZyHPh2slukSw70wM3637Jhhws4nLjX/aicuICSCbJ0T+FBr8TcnHriBhsG0adn80GliQu3EnkW8PA7Wa0+CQVQgXH6ix9jhznV2/BLZrxEhMqXTKZ32UwSeE7Hx8zgmtb7IlsyAQNR/eZsWsYyRItIKWvNuFGAGkb87jUaLTqEzPWNDic3s/ZhBgh/g8zllJRy6cU8Z4NoxsdzikLgFh+rXqi9jntoQG7Ku+Rhx47u3RbEZ3G3+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR01CA0071.apcprd01.prod.exchangelabs.com
 (2603:1096:300:57::35) by JH0PR06MB7210.apcprd06.prod.outlook.com
 (2603:1096:990:8d::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.406.6; Wed, 9 Sep 2026
 06:05:15 +0000
Received: from TY2PEPF0000AB8A.apcprd03.prod.outlook.com
 (2603:1096:300:57:cafe::36) by PS2PR01CA0071.outlook.office365.com
 (2603:1096:300:57::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.406.7 via Frontend Transport; Wed, 9
 Sep 2026 06:05:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 222.71.101.198)
 smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB8A.mail.protection.outlook.com (10.167.253.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.406.5 via Frontend Transport; Wed, 9 Sep 2026 06:05:15 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6A3164092106;
	Wed,  9 Sep 2026 14:05:13 +0800 (CST)
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
Date: Wed,  9 Sep 2026 14:05:12 +0800
Message-ID: <20260909060512.3524983-1-Jelly.Jia@cixtech.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260907-retorted-unfasten-e985a6d4f26f@spud>
References: <20260907-retorted-unfasten-e985a6d4f26f@spud>
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB8A:EE_|JH0PR06MB7210:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: a6635ce2-b2ae-4fd8-0970-08df0e385135
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|82310400026|23010399003|36860700016|1800799024|376014|10067099003|6133799003|22082099003|18002099003|56012099006;
X-Microsoft-Antispam-Message-Info:
	Io553nPbSPc5gMhQ5bwXgU06mNgQAsysd8nvEvUEl8ahXEnDsHZmz4jZ1lqDzQPzazs0Sj93wcm2oQZ/ES3UoDfLIUa5DoXMOsai0OUnC9lf/ueJn4jJQ3lk6Tcx82XzeBrKnC6wcv/oAyIraNI1TPzFMmK7czVyjtLBye2PZeFQ2ptUB9j7jcoUgIKZtAdRomn2ozgQqyS3IM12xfLiPAl8XE7REKjsYmuDFwmtH1kUvKIRYlIdXWXjrG8r6phGMGwQRXsyHbbdVU4rxH+4cMZ2D5Xex8yw/wYMU7U++NaEnx2w/av3TL8NyO/T4JWKIKnOzaUqLYQSMBktE9LmpIMTp7GmYXszVeHD2tvMlo7AzNxdl6qNdwIgOcqyGUCOjiXLglJ7Pvochb9raBmCmRKsp7lvOdt/rTpdQSfTqzACvweZOqy2Q4FSa4bCwarRz/siCr4UjZISF6Pcy0v6MabuExAc25VOCeSOC4tRYKqHLA3s2HPOgNaG4tdshImI84hAge379SUfpIROJZLtEQnxVKpkA80nD723UuvI8MGWha2ES1stFZiq46dQZqi+GjcesDvJTNMpj6efszxW5DOLE9NuyCnwKX9GtGJsIW5zihkH5uPpIlc1ARQ92hr+tADH/TMetnhgtnfN0p2ITY9ynl1FlqwgDrSknX0SQqDJmza0j5Bu2+IPx7JqvfXobBm2bht/GxsoCR+XGxn5Jg==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(7416014)(82310400026)(23010399003)(36860700016)(1800799024)(376014)(10067099003)(6133799003)(22082099003)(18002099003)(56012099006);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	zyfKv1pOSHvc2gtgGoRVMxqliWNKgLccJ4IQLKULLgm0686KftQ9bcmLztgwNcKoVh07KWdmCvskN8axrL4i+HDtfgx1f1I6GWwOCelEL61zoFCcEWxVSWKn7KYXn5BIRwV7pAfVT9SNya2JJeQj2bIK4jqLa1i7hkNMyRsrDJsjseKrHo+x8VgueyCNkBXFROdl/7SB1VVpDi/rkGTDT7v+Jgh4w5MzZrfQR+mp0hKcJOK4yzoa/lM5EzsTaP6XQxIagXl6QBo/DyDvaDNFYlfBXgJ36xoZK93lQ9nkK7+YTGbt/XbRRoI5yYnJcW2VuyqCR9CnQMXINbORqQRO0RpTdW1rzgdRb0aYlG/xZ13a+jZ8V5mPoRF/BiBiD+8vGFyeTaiEUqACH/mPk2xT6RQLqZ9cMizc8TBRRUZVgFLGjZZe7IkE4e3xU6W2uWEu
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2026 06:05:15.0712
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6635ce2-b2ae-4fd8-0970-08df0e385135
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB8A.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7210

Hi Conor,

Thanks for the review.

> I cannot really speak to whether this is a correct thing to do with a
> dma-350, but it seems to me like something that should be resolved with
> a device specific comaptible in the dma-350 node. Someone more familar
> with the IP will have to comment on that.

The wrapper is there to keep the platform integration bits (clocks,
resets, interrupt routing) out of the generic driver: the arm-dma-350
child stays plain so the existing driver binds to it unchanged. I don't
know whether other dma350 integrations need the same resources, so I
did not want to push them into the generic node.

> However I would like to know how this impacts the existing dma-350 in he
> sky1 devicetree.

Patch 5 converts the existing FCH node to this form: the register window
and the eight GIC interrupts are unchanged, the arm-dma-350 controller
becomes the dma-controller@0 child, and the SCMI clock feeding the
instance is added. The AUDSS instance is new. I'll describe this
conversion in the patch 5 commit message in v2.

Best regards,
Jelly
