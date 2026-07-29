Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazon11020091.outbound.protection.outlook.com [52.101.228.91])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0DF30EF9B;
	Wed, 29 Jul 2026 14:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.228.91
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785335447; cv=fail; b=WoyOlHZVjGVFMd0oyzqDZhQ4AJEn673r9qf0FT7Y5oFaN1HEQ1hzrLtgs0Qo6mK80agemryh68lrFl++Dbn7otGX2Hfps+14XfIv0puwJlmEpNfea9pOSpwyIandudMjfJ0UgfWKh3READ0EXEx1rVJ9os1weU1kCGTBZvWSLNw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785335447; c=relaxed/simple;
	bh=FVdbSuHNJ1j7+A/ODUiQ4Iz0+ZW/h1Ac+u4YHiuL2U8=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=QeWxtXrxGtTYTrg+D6ZhRsJEr7UWEYebkm8bJtFGM1h7qeT+kOcI36Udan2tb2SD3J+oSt3qJYoVUZt+uu4IIB3N+Oj9sjjyvQTWON9F68VLTPxMGCUMIhx0Tj0tfB+2JRe3QIF8DVEpYm0TN0X97EZETNFQ06fTrQHr7KJt4tw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=VtpODY1S; arc=fail smtp.client-ip=52.101.228.91
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="VtpODY1S"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qM4PDQoi/g1WFDyql3LaZEGQ7BQE95Bt1e3pKtAP21hkb8KofDj+kIR+ooWy7rNA3ur5Gwn20zgNhQFVITv/sjprCBsHxmjx568NPiiO1pfn+lIhpeHCHMQFcb793Y8SvztfCx3r2zcxBTviE7uufhUvNmOGYYfU04vBdeJ1ZOXVztx1Xi/WEmtXzJFHOqx1YmoNfn0q0KXOTr9pHtC6HSwgrseqwPHYLFoWisfXaYEVk8a6Q5VlcOzbqehGisu5qleLifnDlZyI/Oho/43yHb0Kg/CZJB527B5WkG8TfSbEUzyvlJLSylfLbbNCzN8LqdfU3wi7HuABBFkiC3FqrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=knhSIMG8Y79nZE/BPDL4C7XecHah6Y9G/CJw8p8AgiQ=;
 b=K+m2JEybvF4crMLkGw1X48O08X3DaUfcwffZf/TZ778TcJ5p/FvNuOEUv4O5oTKkfFs//FzWZMNWBuHYi1GWKpNutzfwAfiaUGHUR1Vu5GOMeQEVcQxbYUHafjt9ijl0ySrjeQA/+i9zZRpHWuN7PcP8HXDE+iA4JSJQKM4LHD3UY3rSDRJwppafkP9A1W2CqDGL18Eulp01gHUFNMAldeEY4FN7kls1lcc4LPukNiBTbQI9zC/BNPDcaevXUnvTwqhfyfbf/9fo4flwhFHT4jOMG0J9Ukdxsohe6eQrLO7dL1Cbb719aUaByosNvIlpLUE4+NyiHb8PfS2xwnze6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=knhSIMG8Y79nZE/BPDL4C7XecHah6Y9G/CJw8p8AgiQ=;
 b=VtpODY1SjvJ8qy58K/8rcpu7Z1pbfvEq1iBxR0yPYuMk6OlvwyCRlOJDLJkJ5wlPvLJUOeVHGXvVXE8fAT5v3titwHLQkUTMQOUKZPokJlMHsGzlxgXWbLd/btLLE+HA0Lfhtq/OWP7qEih61V8HDp1NyKjvQCECWm/hfIqzDLU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB5289.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:112::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.12; Wed, 29 Jul
 2026 14:30:41 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0270.009; Wed, 29 Jul 2026
 14:30:41 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Gustavo Pimentel <Gustavo.Pimentel@synopsys.com>,
	Kees Cook <kees@kernel.org>,
	=?UTF-8?q?Krzysztof=20Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Christoph Hellwig <hch@lst.de>,
	Serge Semin <fancer.lancer@gmail.com>,
	Cai Huoqing <cai.huoqing@linux.dev>,
	Niklas Cassel <cassel@kernel.org>
Cc: Devendra K Verma <devendra.verma@amd.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 00/24] dmaengine: dw-edma: Support dynamic LL appends
Date: Wed, 29 Jul 2026 23:30:12 +0900
Message-ID: <20260729143036.3087722-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0046.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:36b::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB5289:EE_
X-MS-Office365-Filtering-Correlation-Id: 34973225-2050-4449-6787-08deed7df7a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|10070799003|7416014|366016|1800799024|23010399003|921020|18002099003|6133799003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info:
	L8+rL5CrYiDl048wkw92OHxQAej+xjoHmZLDgmPICCHE68fm4ijJSuOSiOgLE1LlmtbSDlPRf8FGnNPxAtRetXEZd/p/GV9hZjRV+1q2lfrcZi4oK1o8tq/b9W9JQfrLpgWpKStgzxxhDY1wTLMnKns33eedj0oOmfkZIBzlxpHgjm2Hsd5hK6ZPp0ARybQOFTBzo0JeuyVXzakhuAkZeGy9idSmc5C1XngJqjk9gA2qx5d8ZNYKG2Pl3YbINf1LIrX2GBdEk7hblb9prNtQdwCtIU58bs287r4vgesLlyV5kdKdgc8gOfi+L91HOWa0oIgXrnFN1hYxqGINY2VAxzo7gM52quKnjQUgQ5KRYafQbvHCcwP1IE+ld2yZFKGYwXbRv5pAQFAEc2yVDey1JnR0W5iBIvKLa7ol8to0ZAp1S5P8kETUEIX6/QdsicoarMU6uiDo8gVYPp+w7teEFnNBpVlRuSGFiSBVcZIt53KdbR9T0ZQimnt6lsFm0JQ2Zr4nkuTUGXS+7/qQjUTWFp0jKr8RcCEgKGXz94REa/jaMWFrwnRYTTl77jE6JKGPfKujJ7cYX3sai/v9c7KvP/M2Tb3FbBYmLGfjRiemQfsaK4LW1SYG6dkD0+F9FriGP6rO5+Vr59FQ8NkVvJKHSC6EtrUKb8Ou8AhjPoKjR8XU82og10B+CHpW9aIKC6AvJw1MIHPzVBcwotIGlG2wpA==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(376014)(10070799003)(7416014)(366016)(1800799024)(23010399003)(921020)(18002099003)(6133799003)(56012099006)(10067099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?LnZQX01ZIq+2YPrI+lfA/OyJ5ziLYVQ2w/SYy/HcorI2c2BDtaokq6UcLQw8?=
 =?us-ascii?Q?qTR4OYohXe9SF5LVL2FbCZzcMvO8BpO99E/AeO044I7q1Y7qO+HtEDpLq+KK?=
 =?us-ascii?Q?anj0RBSKSAsCCvGKMYFAmqQpPGqoK6q9okTPQW+t/0xtgd0NlSr0+yFvtjJL?=
 =?us-ascii?Q?Ez1XbU12zTc8TaYxEy+JXRdsjFvaG28ZQ/xfsOsxOFkIB8ZoD1DlY7vncitG?=
 =?us-ascii?Q?BUH1j2S1PRLjc9ZGkiLG5QQPY6Vtoey5/OhVEMfyGn9tRBPnuL+fpD7WFmYR?=
 =?us-ascii?Q?C6RNV1PmbCCAi1BQq4Gh88uZYbAiaKZTb16pn+faYm/mtWOwBXRPo5ZZmvDd?=
 =?us-ascii?Q?h0gOXIjlOQc8ZgHNcf/UarCa4sQzkBvIBmx3ueHEWnbAAiZ6DcY9+jbDE76M?=
 =?us-ascii?Q?VStcj1gLppQtnK6A7ceskOVyX2ye0NGKNoaSbxFl5W4yG7ZTtEtJRG0ST11n?=
 =?us-ascii?Q?1h/4Wq5t/+9++8IATKKdoy1whoqeHoLu9gx/KlADl1MtfNQ/0JIm+ug/rVxB?=
 =?us-ascii?Q?9t09J8RCdjzWRzCEWnq6o9jG2HvRQk6Hl0cpUo1NJlUN3e4YC35KPlRyanB3?=
 =?us-ascii?Q?3igSCS4mVdavZoQq4uYOPpPXzLBAThb7pkkyG4wkLlEAbvmzlXRIkPgb82Al?=
 =?us-ascii?Q?SEquYY25T0aC+VHMBImbN29f8Q2hp5Cx+1oUvUrAuHMum2JEZOHpCYruNdgj?=
 =?us-ascii?Q?UeHKNuFG6ZPN5+nkf2UYYN0uWYvOcuz5NWMZocJD5WHIgfkD7MoXSM5jSayG?=
 =?us-ascii?Q?57xN7JOHU/I4Hxitjay9MXayX7OoZxef6C3Ma5ganmsOyjgHlXdX227cvlfA?=
 =?us-ascii?Q?zc7EKhYv35J7H8JdW5NKT6K70PRVo0k8x38a7fmasg8WjusIBwEvyZImd/GE?=
 =?us-ascii?Q?TIXRfHeHlsdPPsxdEehDsrCPnoyqaXx7ahx1/GCl4RsB6tB+vR/s64H4n/RB?=
 =?us-ascii?Q?UqQX72GXrseE3W7z8JVqKkBhQxCqKflCdorj0lwWINpTGTRLi7t5QBfEbx3y?=
 =?us-ascii?Q?gY4m88wXSVqojp6aicZaqeOBN9tiWNzDvanoFHcieSN5g9dnjuqLS5TOHUTS?=
 =?us-ascii?Q?lfCGXbqsBqxwi+ZsAKMdTPE1ofZkH3BvcGVuE9tepGQ5fZthoRllOIL79kTO?=
 =?us-ascii?Q?SeH2nUEZkGzRz5vWKu1+WhfoS9geiRgpu4bSPAA1nRV0HuI0isUCiHrswJv1?=
 =?us-ascii?Q?KW9y0TPtj+8q7Gcsx7Yr4r0ZouclAYVdn9cIhte2OLlbcn0gk3edhXdTn3TL?=
 =?us-ascii?Q?7iKuL88oWlKvrH6v4PPH/0rsfDWzOuOG7CcjhbpDVDQhgUnhQUsnsMmWyaqB?=
 =?us-ascii?Q?Kh7TlGNHbsNKUmYtrIzuziGRX2emMfCkAtBO5qbCUgZrNWIi1UOCjUj08ccc?=
 =?us-ascii?Q?v9A6aPqI/OYzXiFgP6LEHcI4AAUV132Yqck5KTZduP4OBDuE1Ymd1jdJFE9h?=
 =?us-ascii?Q?UbvGq3G8thXvnfZsdwt0LRxL5Ud71tlSzwVOEsz88owedv10pJcouQycaDoj?=
 =?us-ascii?Q?Shd9dG8cHR+SklnpEgEfR5k/QoA907EIdKgvhdQoqtQcGuuIFT9YmvMtMhuF?=
 =?us-ascii?Q?bsvNHnn9yND79GmgBKpu/+A21mwSq0aqrsu1Yewayckk/5tY69FSjfKmrpfY?=
 =?us-ascii?Q?LQiHlklteXPrfFRIVqBKiZbCpYPSe31Y36YFcF7nWSB0Dfmo39KHBw0nSShz?=
 =?us-ascii?Q?y1TZR6pu1zITGEMAfVvvSCN5/i97D9sENKKVjcGK5huggDdb9Bc8MDKvNcpQ?=
 =?us-ascii?Q?zXnG7xVyj4UTsStvbBgK288PZtwLjDev/6AtdZP2VpKkp3436YB0?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 34973225-2050-4449-6787-08deed7df7a0
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jul 2026 14:30:41.5294
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XW76BFzLRE7isSnevKgZoKFERFvxPLIjLYUXhpfNunYyQuzWLF4/ynP/SSYzezkdtjUAv949jeUTVeyGj/zYZA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB5289

Hi,

This is v4 of the dw-edma dynamic-append work originally proposed by
Frank Li in his RFT:

  https://lore.kernel.org/r/20260109-edma_dymatic-v1-0-9a98c9c98536@nxp.com/

The driver currently treats each linked list as a finite transfer and
waits for completion before publishing more work. This series turns the
list into a circular producer/consumer ring and lets LL channels accept
new requests while running.

The motivation and hardware observations are unchanged since v2, linked
below. v4 mainly addresses feedback from Frank and Sashiko. It adds no
new patches.

With multiple DMAengine descriptors in one ring, entry reclamation and
descriptor completion need separate boundaries. The series records
IRQ-paired LLP samples, uses a conservative running boundary for both
eDMA and HDMA, and centralizes when a stopped channel needs another
doorbell.

The recovery patches add an opt-in safeguard for eDMA with direction
reset operations. On one integration, sustained multi-channel traffic
could leave a channel stopped with pending entries. Repeated doorbells
did not restart it, while toggling ENGINE_EN did. Doorbell timing
remains the leading suspect: under heavy multi-channel load,
channel-status updates visible to software appear to lag internal
start/stop transitions. That said, the exact trigger is still unknown.
Any insight from Synopsys would be appreciated. Recovery was not entered
in the fio/nvmet_pci_epf tests below.

Base
====

This series is based on dmaengine/next.

Re-testing with v4
==================

I re-tested v4 on the following three testbeds:

- eDMA: RK3588 Rock 5B, DWC PCIe v5.60a
        R-Car S4, DWC PCIe v5.20a
- HDMA: SpacemiT K3, DWC PCIe v6.30a [1]

1. fio

   The fio setup uses nvmet_pci_epf with a null_blk-backed namespace,
   runtime=30s, ramp_time=5s. The "Before" values reuse the baseline
   measurements reported with v2. The "After" values are three
   consecutive v4 runs.

   NOTE: The fio tests use nvmet_pci_epf, which does not keep the DMA
         engine continuously busy. A workload that rarely lets the
         engine stop would show the benefit of dynamic appends more
         directly.

   - eDMA (RK3588)

     NOTE: The eDMA Before results include the separate regression
           described in [2].

     Summary by group (BW delta %)
       all          n=26 mean=+1129.2 median=+114.6 min= +38.4 max=+5346.2
       read         n=14 mean=+1996.5 median=+859.9 min= +54.9 max=+5346.2
       write        n=11 mean=+102.3 median=+107.7 min= +38.4 max=+168.2
       qd32         n=16 mean=+1775.0 median=+166.5 min= +67.6 max=+5346.2
       q1           n= 9 mean= +75.2 median= +66.4 min= +38.4 max=+131.2
       small 4K     n= 6 mean=+102.7 median= +88.7 min= +38.4 max=+168.2
       large >=128K n=20 mean=+1437.1 median=+120.7 min= +52.2 max=+5346.2

     Before mean -> After mean (MiB/s)
       Case                         Before             After              Delta
       ---------------------------  -----------------  -----------------  ------
       Rnd read     4KB q1  1j          19.2 (sd 7.5)     36.7 (sd 13.5)   +90.6%
       Rnd read     4KB q32 1j          88.7 (sd 2.1)    148.7 (sd 54.5)   +67.6%
       Rnd read     4KB q32 4j          88.7 (sd 1.3)    165.6 (sd 84.0)   +86.7%
       Rnd read   128KB q1  1j       420.0 (sd 134.6)   719.0 (sd 184.5)   +71.2%
       Rnd read   128KB q32 1j        142.0 (sd 37.7)  2544.3 (sd 132.2) +1691.8%
       Rnd read   128KB q32 4j         63.7 (sd 10.6)   3020.0 (sd 29.7) +4643.5%
       Rnd read   512KB q1  1j        572.0 (sd 35.8)    952.0 (sd 44.9)   +66.4%
       Rnd read   512KB q32 1j         66.8 (sd 10.8)   3007.7 (sd 38.2) +4402.5%
       Rnd read   512KB q32 4j         55.4 (sd 12.0)   3019.0 (sd 39.0) +5346.2%
       Rnd write    4KB q1  1j          20.7 (sd 7.0)     28.7 (sd 15.9)   +38.4%
       Rnd write    4KB q32 1j          42.5 (sd 0.9)    112.4 (sd 17.8)  +164.7%
       Rnd write    4KB q32 4j          41.7 (sd 1.6)    111.8 (sd 18.8)  +168.2%
       Rnd write  128KB q1  1j        330.0 (sd 90.1)    542.3 (sd 91.2)   +64.3%
       Rnd write  128KB q32 1j       624.0 (sd 111.5)   1309.3 (sd 60.4)  +109.8%
       Rnd write  128KB q32 4j        659.3 (sd 61.8)   1292.7 (sd 59.2)   +96.1%
       Seq read   128KB q1  1j        260.7 (sd 25.8)    602.7 (sd 85.0)  +131.2%
       Seq read   128KB q32 1j        149.7 (sd 30.9)   2527.3 (sd 13.0) +1588.6%
       Seq read   512KB q1  1j        578.0 (sd 32.2)    895.3 (sd 24.6)   +54.9%
       Seq read   512KB q32 1j         65.0 (sd 10.6)   3017.0 (sd 34.9) +4541.5%
       Seq read     1MB q32 1j         57.3 (sd 18.8)   3018.7 (sd 30.4) +5168.2%
       Seq write  128KB q1  1j        272.3 (sd 62.0)   565.7 (sd 111.2)  +107.7%
       Seq write  128KB q32 1j       597.0 (sd 105.7)   1309.3 (sd 62.1)  +119.3%
       Seq write  512KB q1  1j        476.7 (sd 26.7)    725.7 (sd 32.7)   +52.2%
       Seq write  512KB q32 1j        710.7 (sd 44.0)   1297.3 (sd 57.9)   +82.6%
       Seq write    1MB q32 1j       546.0 (sd 100.4)   1213.0 (sd 56.3)  +122.2%
       Rnd rdwr  4K..1MB q8  4j       247.3 (sd 16.3)    943.3 (sd 88.5)  +281.4%

   - HDMA (SpacemiT K3)

     Summary by group (BW delta %)
       all          n=26 mean= +85.6 median=+100.1 min= -26.9 max=+154.7
       read         n=14 mean= +76.9 median= +84.2 min= -26.9 max=+144.0
       write        n=11 mean= +92.0 median=+137.5 min= -24.5 max=+154.7
       qd32         n=16 mean=+112.0 median=+106.1 min= +71.8 max=+145.6
       q1           n= 9 mean= +33.0 median=  +4.7 min= -26.9 max=+154.7
       small 4K     n= 6 mean= +76.9 median=+101.8 min= -19.5 max=+144.0
       large >=128K n=20 mean= +88.2 median=+100.1 min= -26.9 max=+154.7

     Before mean -> After mean (MiB/s)
       Case                         Before             After              Delta
       ---------------------------  -----------------  -----------------  ------
       Rnd read     4KB q1  1j          52.5 (sd 3.5)      55.3 (sd 4.4)    +5.3%
       Rnd read     4KB q32 1j        108.1 (sd 90.9)     263.7 (sd 7.6)  +144.0%
       Rnd read     4KB q32 4j        117.0 (sd 84.9)     267.0 (sd 8.9)  +128.1%
       Rnd read   128KB q1  1j       835.7 (sd 139.6)   611.0 (sd 171.4)   -26.9%
       Rnd read   128KB q32 1j        802.7 (sd 67.7)   1623.7 (sd 13.1)  +102.3%
       Rnd read   128KB q32 4j       931.3 (sd 262.1)   1666.3 (sd 10.4)   +78.9%
       Rnd read   512KB q1  1j       411.0 (sd 144.0)    895.0 (sd 90.4)  +117.8%
       Rnd read   512KB q32 1j       969.0 (sd 210.7)   1664.3 (sd 10.1)   +71.8%
       Rnd read   512KB q32 4j       889.7 (sd 298.0)   1679.7 (sd 12.5)   +88.8%
       Rnd write    4KB q1  1j         46.0 (sd 15.5)     37.1 (sd 18.7)   -19.5%
       Rnd write    4KB q32 1j         117.7 (sd 4.0)    232.3 (sd 10.1)   +97.5%
       Rnd write    4KB q32 4j         113.0 (sd 5.3)     233.0 (sd 9.5)  +106.2%
       Rnd write  128KB q1  1j       606.7 (sd 149.0)    458.3 (sd 20.2)   -24.5%
       Rnd write  128KB q32 1j       533.6 (sd 512.3)    1267.3 (sd 2.1)  +137.5%
       Rnd write  128KB q32 4j       526.0 (sd 514.9)    1266.7 (sd 2.3)  +140.8%
       Seq read   128KB q1  1j       626.3 (sd 247.5)    655.7 (sd 90.8)    +4.7%
       Seq read   128KB q32 1j        783.3 (sd 51.1)   1613.3 (sd 12.7)  +106.0%
       Seq read   512KB q1  1j       464.0 (sd 191.5)    918.3 (sd 18.0)   +97.9%
       Seq read   512KB q32 1j       918.3 (sd 241.8)   1640.0 (sd 35.5)   +78.6%
       Seq read     1MB q32 1j       918.7 (sd 290.5)   1649.3 (sd 42.7)   +79.5%
       Seq write  128KB q1  1j        611.0 (sd 79.8)   531.7 (sd 128.7)   -13.0%
       Seq write  128KB q32 1j       521.8 (sd 515.3)    1266.0 (sd 2.6)  +142.6%
       Seq write  512KB q1  1j       328.3 (sd 268.7)    836.3 (sd 34.7)  +154.7%
       Seq write  512KB q32 1j       519.6 (sd 516.6)    1266.7 (sd 1.5)  +143.8%
       Seq write    1MB q32 1j       515.1 (sd 517.8)    1265.3 (sd 2.1)  +145.6%
       Rnd rdwr  4K..1MB q8  4j       355.3 (sd 64.7)     840.3 (sd 3.1)  +136.5%

2. pci_endpoint_test

   READ_TEST and WRITE_TEST passed with v4 on all three testbeds.

3. R-Car S4 (PCIe Gen4 x2, DWC PCIe controller v5.20a, eDMA) stress

   The non-upstream NTB transport/netdev saturated four HW channels in
   each direction concurrently from multiple QPs. With v4, it still
   reached EP->RC 18.7 Gbit/s and RC->EP 15.7 Gbit/s with iperf3 -ub0,
   while keeping the DMA controller almost continuously busy.

[1] K3 was tested on an Ubuntu kernel with the prerequisite patches
    backported (+ some tweaks on top), not directly on the upstream
    base. The "Before" and "After" kernels differ only by this series.

[2] The current base includes commit 35de39e4511f ("dmaengine: dw-edma:
    Defer channel IRQ handling to workqueue"), which defers channel IRQ
    handling to an unbound workqueue. Under CPU pressure, some workloads
    can see delayed completion processing and idle gaps between
    descriptors. Dynamic appends largely hide those gaps by keeping the
    engine fed.

    A BH workqueue would improve the nvmet_pci_epf workload, but it is
    not a complete replacement because BH workqueues are per-CPU.
    Retaining cross-channel CPU distribution would require the driver to
    choose target CPUs and account for housekeeping masks and CPU
    hotplug. That is too much complexity for a quick fix, so I have not
    posted a separate change.

    This partly explains the unusually large eDMA gain in these tests.

Best regards,
Koichiro
---
Changes in v4:
  - Use spinlock_t for LL event serialization, select the event lock
    through a per-channel pointer, and use the common accessor in both
    interrupt providers. (Frank)
  - Put the remote LL publication read-back back in the high-level
    doorbell helper, while keeping the provider callback as a raw
    doorbell write. (Frank)
  - Arm the stopped-tail recheck after a stopped channel is kicked,
    reserve its zero sentinel across jiffies wrap, and keep the recheck
    available without optional direction recovery. (Sashiko)
  - Keep retrying failed direction resets with cancelable delayed work
    instead of giving up after a fixed number of attempts. (Sashiko)
  - Other smaller fixes, patch-ordering changes, and wording updates are
    listed in the per-patch changelogs. (Frank, Sashiko)

Changes in v3:
  - Main changes:
    * Serialize IRQ event capture and ABORT handling with channel restart,
      so deferred events cannot cross into a later hardware run. (Sashiko)
    * Record each descriptor's physical LL range and validate it before
      consuming IRQ-paired progress. Keep ring accounting valid across
      termination, abort, and full resynchronization. (Frank, Sashiko)
    * Rework stopped-tail and STOP/PAUSE handling: re-sample LLP before
      restart, add one bounded eDMA recheck, and drain published entries
      before completing a request. (Frank, Sashiko)
    * Move LL interrupt placement into the common core and use the same
      four-entry interval for eDMA and HDMA. (Frank)
    * Restrict recovery to providers with usable direction-reset
      operations and serialize it with IRQ/ABORT handling and teardown.
      Rebuild all exposed LL contexts and flush remote LL writes before
      re-enabling the engine. (Sashiko)
  - Many other smaller fixes, refinements, and patch reorganizations
    came from the v2 review, especially Sashiko's feedback. Each patch
    has its own changelog below the --- separator, so the details are
    not repeated here.

Changes in v2:
  - v2 is a substantial rework; per-patch changelogs contain the details:
    * Rebased onto dmaengine/next.
    * Moved the remaining v1 fixes and state serialization changes into
      the independent groundwork series, now merged in the base.
    * Reworked ring progress around IRQ-paired LLP samples, conservative
      running boundaries, and stopped-tail reconciliation.
    * Reworked STOP/PAUSE handling and added full ring resynchronization
      plus optional direction recovery before enabling dynamic
      submission.
    * Updated trace support for the reworked paths and added engine
      recovery tracing.

v3: https://lore.kernel.org/r/20260727170323.2321369-1-den@valinux.co.jp/
v2: https://lore.kernel.org/r/20260723084150.521366-1-den@valinux.co.jp/
v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/


Frank Li (5):
  dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL
    entry index
  dmaengine: dw-edma: Make DMA link list work as a circular buffer
  dmaengine: dw-edma: Move callback result helper before LL helpers
  dmaengine: dw-edma: Dynamically append requests while running
  dmaengine: dw-edma: Add trace support

Koichiro Den (19):
  dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL
    control-word
  dmaengine: dw-edma: Factor out linked-list transfer start
  dmaengine: dw-edma: Dispatch DONE interrupts by channel request
  dmaengine: dw-edma: Centralize LL doorbell decisions
  dmaengine: dw-edma: Prepare LL progress event handling
  dmaengine: dw-edma: Prepare deferred IRQ reporting for LL events
  dmaengine: dw-edma: Prepare LL kicks for event serialization
  dmaengine: dw-edma: Serialize LL event capture with channel kicks
  dmaengine: dw-edma: Keep channels stopped while ABORT is pending
  dmaengine: dw-edma: Reclaim issued descriptors from IRQ-paired LL
    progress
  dmaengine: dw-edma: Add LL interrupt placement policy
  dmaengine: dw-edma: Recheck stopped LL channels before restart
  dmaengine: dw-edma: Use HDMA watermarks as progress events
  dmaengine: dw-edma: Recover stopped channels from tx_status()
  dmaengine: dw-edma: Make the LL ring reset a full channel resync
  dmaengine: dw-edma: Drain LL entries for STOP and PAUSE
  dmaengine: dw-edma: Add engine reset and enable operations
  dmaengine: dw-edma: Add engine recovery infrastructure
  dmaengine: dw-edma: Detect and recover a stalled eDMA engine

 drivers/dma/dw-edma/Makefile          |    2 +
 drivers/dma/dw-edma/dw-edma-core.c    | 1574 ++++++++++++++++++++++---
 drivers/dma/dw-edma/dw-edma-core.h    |  159 ++-
 drivers/dma/dw-edma/dw-edma-trace.c   |    4 +
 drivers/dma/dw-edma/dw-edma-trace.h   |  169 +++
 drivers/dma/dw-edma/dw-edma-v0-core.c |  201 +++-
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  163 ++-
 drivers/dma/dw-edma/dw-hdma-v0-regs.h |    1 +
 include/linux/dma/edma.h              |    2 +-
 9 files changed, 2010 insertions(+), 265 deletions(-)
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.c
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.h

base-commit: 0613e7934ee233d726af8d8c89f251a1c4df738d
-- 
2.51.0

