Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.138
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793868165;
	b=14CI8aROElNzvNXjinVYZdr7rgx/3DNaQMAEA2T7KLdODSvWcLRGMbfEGYFICURRhM0h
	 pG/X42ma+y95IekNBQOicXNhntIuhp2GJp3cJGhqysX1qIGBXfXEMC0vfkWiyoL+si9UH
	 rtGHFPlHZUe7Y0dZSkTP29EpwYIpfvKdlXsILse90DTI202g7z2nkvLqf6H3JlwOI3AR5
	 Wm7TMGj7HREWpok7LPam+ZXj/6ECen6mR44ldRjAB4Y1q+LJHEMFQouUl21y33w7Nqia5
	 Y47M3lC5n+FvbJ3q5RF4K0/yhqGP/QIna561TJSteCYIovKYlWkdHGu3YyY2f9ybyBw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793868165;
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
	bh=rSmEnELfbwYAIBoQiV/ny03M/DIIsFxPkRrucuPQjI4=;
	b=fqLIhpcU/rOgMYoQDasd4O1TM5/sAIElx9uAhRI4DVF9iYgPIiS9o/Ohh0yMI/t5ZVil
	 2raTF+1wt38eYZ6PqOKjkAyZ/C4HBwLeUmf25KG0G5mZvab+40lC3GCXvJkxYNKRjNbXT
	 f5xQ13XhiupkuZfQD+sI5qNrMRCAWOimDqloQ30SP7/8k5nV+nX5gdC0TCGW+0jGVZylg
	 GNeDOXgWKFDESyxrmESGpXMOdUdFDAhLiv55O7p40wiG+rR356bi5ysqn5CIHjGCuwKxl
	 dExfdGak6UwgXqK5MXvQJben/kfMd7rRcMFxuS0ng+dLokiReXdb+UZJKMYg+l7O/cQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=cixtech.com;
	spf=pass smtp.mailfrom=cixtech.com;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.138
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022138.outbound.protection.outlook.com [52.101.126.138])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83834606A31B;
	Thu,  5 Nov 2026 08:42:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 83834606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=cixtech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cixtech.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yEuEgSU82oUoyjXtKqOKY+HdYltPTS8aISi+GwyX2mUNMMApGE37108z1F8amu/+uGmZ+HsjN7YPOJaYY2UdGCVBgtYTjsl5R/N4+qH+zcgLSiyPvtONGryb8tVnvWwslPD39oJlZTPKAfpihAISpKQc9p5WGeas3E8rNo/XBEit4JVXvBfF1iCv6Aztk8Twus3lw4SNscDQ8D2dGZcL+P1C3LKAKOkD2UccPbQwmCGzIUBrPSLpwUK6Upu668iZUURDV+0aFehqCLuN4AU/oNdkDRkKlRfT5Csp8tIhYdRNvHpayzGy6d2V0RjXeO6NM+78SvN4Ka7VZ73MLkyPNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rSmEnELfbwYAIBoQiV/ny03M/DIIsFxPkRrucuPQjI4=;
 b=RE0451XeWohvDoCtyiGBwqrcAAOlNuW1AetnxRsP3oHVGMNe6GP67KmUavCEWNjkcJOB6n1fExVFr/EzJ491bN7lonS0gCCHu2ZEEiTkJlsKYSQ5ff58K6hJyxiohU/VaOCFhCBgVxH5/lCrxadkhM9Jg5cr9YicdVYNbgACvwPOnxlg2jbIHvYvaWRACAyumLKFWsUXwPcqmpnvG+o8FUJfWD4NGVophjH9vFm3G5UtNkxrZF6vZseMNEjmHuGLdlv4sPW2sAsWrKQAc0/9wKPy2IYTIvZnqwaIsgQuO5cqEZQiZuDYCOhWqlC8wDnBVimL11XSVc7zdaidfv+lYA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 222.71.101.198) smtp.rcpttodomain=arm.com smtp.mailfrom=cixtech.com;
 dmarc=bestguesspass action=none header.from=cixtech.com; dkim=none (message
 not signed); arc=none (0)
Received: from PS2PR03CA0015.apcprd03.prod.outlook.com (2603:1096:300:5b::27)
 by SEZPR06MB5455.apcprd06.prod.outlook.com (2603:1096:101:cb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.4; Thu, 5 Nov 2026
 08:42:39 +0000
Received: from TY2PEPF0000AB88.apcprd03.prod.outlook.com
 (2603:1096:300:5b:cafe::23) by PS2PR03CA0015.outlook.office365.com
 (2603:1096:300:5b::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.615.4 via Frontend Transport; Thu, 5
 Nov 2026 08:42:39 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 222.71.101.198) smtp.mailfrom=cixtech.com; dkim=none (message not signed)
 header.d=none;dmarc=bestguesspass action=none header.from=cixtech.com;
Received-SPF: Pass (protection.outlook.com: domain of cixtech.com designates
 222.71.101.198 as permitted sender) receiver=protection.outlook.com;
 client-ip=222.71.101.198; helo=smtprelay.cixcomputing.com; pr=C
Received: from smtprelay.cixcomputing.com (222.71.101.198) by
 TY2PEPF0000AB88.mail.protection.outlook.com (10.167.253.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.592.5 via Frontend Transport; Thu, 5 Nov 2026 08:42:38 +0000
Received: from ubuntu (unknown [172.20.64.99])
	by smtprelay.cixcomputing.com (Postfix) with ESMTPSA id 6A66D4102E60;
	Thu,  5 Nov 2026 16:42:37 +0800 (CST)
Date: Thu, 5 Nov 2026 16:42:36 +0800
From: Jelly Jia <Jelly.Jia@cixtech.com>
To: Frank Li <Frank.li@oss.nxp.com>
Cc: vkoul@kernel.org, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, robin.murphy@arm.com,
	devicetree@vger.kernel.org, Frank.Li@kernel.org,
	cix-kernel-upstream@cixtech.com, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 3/5] dt-bindings: dma: arm,dma-350: Document optional
 clocks and resets
Message-ID: <auxBfKB+KFR13/+g@ubuntu>
References: <20261104124411.296640-1-Jelly.Jia@cixtech.com>
 <20261104124411.296640-4-Jelly.Jia@cixtech.com>
 <auuIrNTtrm7Tn4vb@SMW015318>
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
In-Reply-To: <auuIrNTtrm7Tn4vb@SMW015318>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF0000AB88:EE_|SEZPR06MB5455:EE_
X-MS-Office365-Filtering-Correlation-Id: 6238d206-691b-45bb-045f-08df3b18bfae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|82310400026|36860700016|7416014|376014|23010399003|10067099003|22082099003|18002099003|4143699003|56012099006|261028144727099003|261022105027099003|261026140227099003;
X-Microsoft-Antispam-Message-Info:
	izOSKAhRw0pqmx+Eny962D+Mh4YWRTHQnOQkAf1l1rZl+IP2DwJxcp4QwLWAKgCIC8Sm2MaTia8ldGWH8b39zzzq5d3GwEHY5BiEQqCSdrYaHGVQ6DlnMT1VLgCsKW/yhqOVV6oNyz0Aw/8ZdGNQDLtLxIE3twoS9rSANBCReNKFMExbGx9p9oELnofGkng3cdJe6WwRqr6ay7nuIubPL4YSdikDVYSQ/WMqaLhLO2xysx8R14HBNCv5mCZB+6vzAauvMlWhhU3aZ4f5H0TsZ9esMixvz7887dmD3v/fJ5Wr0s4VSnn2MSyezKjAz31V4VoA84c800htKvypDaDcwnIMbfDXhmF7VfR6iapefxGik57RVvOtD+rvnVndnshvETft7hBQVIGCKPkzV8/8WV4r17+ha98HL9HdydjrQJo0Lb9iknd8eUauI5eExMnGyLX+oKx0N+3N1eYFYSs5DAcEl2J20LuV5iFZkMTwBPsfLw6rDFzirSxXlGKZN8Q0JLZYrb6JmUOZVS8azVmYznoQLjncAfRA31YWn8Ow+NdT9FeCbd6pre/8i0wqvaQ7/nXYali1Pd7zKeEZfjiT4LM73r8Yy5B01swn9NK0kxPDnNsaAULIJqNoCHc/qmt6osVEVLzQui4I5meS/3JbJ+1r2Nu+psdPtCCqjyO+rIFjrZYtsNr5Da3OgtxrAenzjZeGNgi8OIAUYQGciAz0dA==
X-Forefront-Antispam-Report:
	CIP:222.71.101.198;CTRY:CN;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:smtprelay.cixcomputing.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700016)(7416014)(376014)(23010399003)(10067099003)(22082099003)(18002099003)(4143699003)(56012099006)(261028144727099003)(261022105027099003)(261026140227099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	QkkoeXhU5dzvq65EhS895YGIqORXT154Wxt4FxAw4b7saUq738jHkAK6Qx5ztCOm27mKwZKsimfnM7XoH2fJY6IUh2fNQ3u0FuRmEo094y9tqzg5OJUwIsSo4AzzNO/h4uwCfrjTE81I8EwD499Ncti9IAAYvgJAK15hqLfxvyiVGKhppRXZSvem9jCJwUNj94ZluNGLq6AqHlAm2O2XsTQ92xCydbp3kzLBX+aL5yys+OYYpd1eKKTsp0I3Y5a+7OQhaN5V+qyZc/pKt5clQSMKWk0DxBQn6PQyvHHG6Yol8M0dZjnDxfx34x8nK+8Cbm1r3NYhGYe0t31NtGF719lmSWq+wrikCDqJXJNk9HwKn3rJm52zv5ll6tqhZpIkndAdVOo/X/BibTKVQ/EowFqMbbsV7XPmsSKNIIlxJ1xMmao6yUD716mvTOBx4gOQ
X-OriginatorOrg: cixtech.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 08:42:38.6968
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6238d206-691b-45bb-045f-08df3b18bfae
X-MS-Exchange-CrossTenant-Id: 0409f77a-e53d-4d23-943e-ccade7cb4811
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=0409f77a-e53d-4d23-943e-ccade7cb4811;Ip=[222.71.101.198];Helo=[smtprelay.cixcomputing.com]
X-MS-Exchange-CrossTenant-AuthSource:
	TY2PEPF0000AB88.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB5455

Hi Frank,

> Suppose you should add front compatible string and fall back to arm,dma-350
>
> and use front compatible at if branch to restrict clocks and resets.

Thanks. I've updated the binding locally as follows:

  compatible:
    oneOf:
      - const: arm,dma-350
      - items:
          - const: cix,sky1-dma350
          - const: arm,dma-350

and added this condition under allOf:

  - if:
      properties:
        compatible:
          contains:
            const: cix,sky1-dma350
    then:
      required:
        - clocks

This requires a clock for Sky1, while resets remain optional. Both
resources remain optional for the generic compatible alone.

Both FCH and AUDSS DMA nodes now use the CIX compatible with the generic
fallback. The driver's optional clock/reset helpers remain unchanged.

I've tested the updated tree on Sky1 and will include these changes
in the next revision.

Best regards,
Jelly
