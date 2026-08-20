Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11020105.outbound.protection.outlook.com [52.101.229.105])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF88637F00C;
	Thu, 20 Aug 2026 17:34:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.105
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787247289; cv=fail; b=lnNfJJLZTFWLOmuZDsSzYLRgAzNyClFbxae5dHhSHznB261qrezRwtR7DV3OjNT6IQRIUi3iNQ5XK3cqzENDWCmrW2vgyWN0qeZ8yckRG73JZlQTiXtRN3MazG7SN+mW0f7Dh9AU0GMbE3FRpg3W7AiwhWt/NYh6O4az7h3CAkY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787247289; c=relaxed/simple;
	bh=fuKz4SL/MRWPq/lVgZz8lKZS0mw/AuZI8a0pPc5GjCM=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=D0xhTOyUAd58lvTBlMdQSx+7VTIdDMpFNJgUD2Ux4zz3841x9wGzH86c0efFf3NxReNMvrnU1jmW+mJgnlSSI2z4TZezhCjAkUmt+x1Q94CD/pwyLdzMFaTeyMZQyqXT1LkdQx49kBONDsU4j3E6m8XeFNLskddGvqi9QWH4f/Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ZEPllK5i; arc=fail smtp.client-ip=52.101.229.105
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ZEPllK5i"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjzK93/K40htfzhWBSRscvckOtDoRA+u/sh1VImdCBQoYhwt3E85Dc2BFDX3VLntI2JdCrnzRUil8rQ4EmolBomAanEpq8FKxJotJI6B3TfZH/M/xyaK9uQusdYIliooKD3GG0dHSrsXIvF39An8XhB7fX33txsC6B3Qf2l+P4AVStkof93JHvlMELo3vuXoJZ+cYKq7m8QbWK+f7A+029tWUdvrCzkaUbV4EWqANx5oyBui3hMZsPMCb5DQF9BQ9eqZ81MrDeuHUJV/I0Mjarjo8w0MJmYmDSGSIileRlE6FxC4HlEphp67uXCnPPWQxENbizwAOjjsYvtBrFAhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y0LhLDxQmmuuZyEh9LGlTjtl2y3AeW/x6cTeOjHi+nk=;
 b=b7VX4+4tV6Y4wk61EqTyI7oa9ALUO9OJiBMlpAq5aFG5lDOw9/t70e5kOz+mC5dn1TzYMj5elWCDlil/GMoxykxqw4RTBSIPnlucJSunjOSNEawgcIcEUYtrCGyfiDA7JCU7nbygT6L0H+Hmttu0sWURv/gvi5uMtPCbQByLjfqgQbAdPirZyoBy7UZAz/AfeUHqLVJ5cyR6rd6fYO+3fCd2iBjEYdzHu4egx7HjAOuRHK6FRWkmF0yTlE3Moi+O8lnMMEGjZhBdjnu0rdAa5lJvhuyGIFQndEZ69p3xEWOqYgFLTtZEUZPw9Y7btRxkZlZfQR42frHfwBdYYLVFPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y0LhLDxQmmuuZyEh9LGlTjtl2y3AeW/x6cTeOjHi+nk=;
 b=ZEPllK5iBbg7LHNwFnowdJcfkGRCDDFj3hnVHckJy23yRvia53jJsO7vUmafK6q32795hP2kfCth91aLED+/0ad86UOAVSTjGjfXFQT61FUoSEO+WzoVhhWlzP1dnRbjvXKbff+hnrHT/z/pTYUgeAlEzKO+q/BEcpiwGN7WKxc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB7644.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:461::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.339.8; Thu, 20 Aug
 2026 17:34:43 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0339.007; Thu, 20 Aug 2026
 17:34:43 +0000
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
Subject: [PATCH v6 00/10] dmaengine: dw-edma: Prepare for dynamic LL appends
Date: Fri, 21 Aug 2026 02:34:29 +0900
Message-ID: <20260820173439.2004068-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0117.jpnprd01.prod.outlook.com
 (2603:1096:405:379::18) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB7644:EE_
X-MS-Office365-Filtering-Correlation-Id: 3fc8ffff-cb94-4fdf-52c0-08defee15238
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|10070799003|7416014|376014|23010399003|1800799024|366016|921020|6133799003|56012099006|10067099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	e4Qpntd0HD2fGzot2OAxsjdA8Az+x8zzv9oYm8NoIpHRGMmZIlTd9IvWrUCtfj3kTfs6BAUmE3wInHU+7mvf+gp5SXEfg4lvdz17MYV9Gvy3QJCL/OXi/+h8nUSxCNWjTav3f3A9GPmDFWjl518Rb5qzi/uG8MZsBaXBEd2SCQTyIxMeB+6AiOgN2vFFNS7j5n2gIa2KFN8xagk2sXpVfRaPr0nE9MU9E3FOT6qRdxQ/nwh5N9cEMsQdRLeE0ytNrtByooMFqb7WANp84z8B+bxO+FCQn49QypUnz54eInCdpEzHzZR74jTjDEa73aRlYXiSR7YQOwjtMsXJneFw2sy180GklI/0QFobYzVTXWMCX27ontJKB+hXJIN+++AEELThCwNHRxszTKju2o2eRqQkc0vKmXLRK6+y27xNdz7bxYCn9KfFDsZNoAYzOFSm3xstRNzjwb0rSVXGJJ5WUL1+kGSJ9b45ttdgbiYTLOJZs3mGlFdgu5NMXzYXc894V0DtC1pm6uoDuXIlH4yCRPDAAXR5WPNg+JbExs2rvHLZTqn1+QwSoYbNKskleT6la0+qknCOrm8Xz0+8nLSReNRLdxazC4FI9K7rVdEI+O5HCoqFk+fjMEIgzOvjA16p0B1F2wiz70onWIb9zWPCYtsDTEIuEQTOWzXTzT88y1y1nCRKRuQnugKMGAjCEP5WTsm7O5Wid+4AyrPRn7sXvw==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(7416014)(376014)(23010399003)(1800799024)(366016)(921020)(6133799003)(56012099006)(10067099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?8GBo9BWJCxm0l6adDnGbpawo1qJm9cgQMky5AavolKzIx1d8NuxdQ4hA41Rs?=
 =?us-ascii?Q?dW8c+D4kP3hmW7QyoYGdD3wpAacWuKbkQIQl7VHw8s4kyVBiOgU/J7kawIm5?=
 =?us-ascii?Q?XSJio+OnPfBum76ctEjdGI3bNeCeL6fIUuAAoqvlYDFocpJTgMAT5w2oaUVY?=
 =?us-ascii?Q?+R/ckvrJwVuRUZm+tctUt0pGCRbDFsb/6ibhIPoSOc9L84eAx9WQTY24oMc2?=
 =?us-ascii?Q?pUB9rUGhU/0JWoffRajC25qfKe4STpJp45fQ5lFPu0uhiN0GwmzOpZuY8mOP?=
 =?us-ascii?Q?yIkvNgqq+Z1AECrXG1ZzveeyLh19dQfg51rrs9iqzuqGiLskVpF1drspNsHV?=
 =?us-ascii?Q?NTr+uDrZeZeiQ8/34dGwyBRPQ5cJ6hkkNb5UsaQZaKWKOaDWi17e4B3nFcpB?=
 =?us-ascii?Q?Ls6AQ/ZdXc50FNdHT4fQRk5CwmrzYpGiUM7bDLyLEOfaz4yZAZt8vu64xalT?=
 =?us-ascii?Q?k7QEnEAyfXoG7u8h3iyUvKS7qsPoVQpt3gp291tjv8Z2Bx34+kKGfdpWZrFH?=
 =?us-ascii?Q?Jah3dYz11XZj0nr2yWVdatsrCah9JhO4L8mHkEBia8GiXPOcw+C1f+twe52I?=
 =?us-ascii?Q?xA0eDEq3jAZzieOVd7fjKd0HeorJPiyige+22rkm5nUXO1mYSW6+CNDAjGN0?=
 =?us-ascii?Q?k0q/rTmTo2IFupa+sHgb9rm5dnDSI1YgY7LzcETCgTJjf5vYFv27KoIqqQS2?=
 =?us-ascii?Q?EWbb4n7XlVpxCJ2BMdDSwQ8eXneI9+xCS7GVCSkkXOe2lxiifPHhHok6+AJp?=
 =?us-ascii?Q?IlxlFbJf41Ai/WDaIS42e9Hr0UgqeEYsvI8M8owk8WRtKsofd2ZP8gJLgA2Q?=
 =?us-ascii?Q?OLodGZjeWYZgMqy8ISVb8962zSpvNGNqQGRo/A0dwAVggt7cpA73ZGFvBq7q?=
 =?us-ascii?Q?dn/mOTAeHB82nqUsK2VaoZ35wgZMZ0fkJRTgqqJTz6Hh0WeHZf6L9ufLmi8r?=
 =?us-ascii?Q?VhTCLXlk1133TVzxJY4kj5+KtXLxF2NI8ZXOln7vrHIRbpx8afoI+T/qBc+D?=
 =?us-ascii?Q?fAtbNYWY3wYWq/R1IVup6oiWHJIVklb71xtfcljjgcHDjPZ+CBfBnHeu7Mek?=
 =?us-ascii?Q?IeV9KDpk+4fN42lEBcKBWYpeFlISoRGVTpKfT3yHqOq16StOc4o2iRbP/T5p?=
 =?us-ascii?Q?vp0FOiFBIF2W+RlRzjhkF2JqZIZA3PVBRgT9p3B4qSJZn5gDaeaZfmSoBhul?=
 =?us-ascii?Q?fxy7gnXvG4oJ9/rmdaqegh2Gj77APknHLFij43hGsUWgOqzf6satTbRMQAFd?=
 =?us-ascii?Q?kUKglUZB7kg9OY5kP3nSA2vEwrG1l8pP0GOmj0POxNRm8vLZ2GHBr4TSQJBR?=
 =?us-ascii?Q?lNHU/VbbG4kpu2NBqOacYDmqfn46uEasMOYYKaIpysW6G3XkjhlOLjJGgSeX?=
 =?us-ascii?Q?7El2ODDrriR4eELlvbes4vkuQPohk7fWXqMkdoMe+IBaGockUSz3lxufhCry?=
 =?us-ascii?Q?ZvNKM30JrxF0+CautWmnTGsh53lPtKgKS5DZ1kr+JghMN3ebMfYzHqGaPebX?=
 =?us-ascii?Q?Zz8GfacYOnojdjjLpgt6N5luIoiM5+hlDjdxs2g+fD9Bpq6CKXA8BIWQGJPC?=
 =?us-ascii?Q?fK930kboaK64t8utyuLhVE+ZWdp82fnnhGoV2fOr/iCkQoFfzRRAPmfYXJiy?=
 =?us-ascii?Q?XgGVovZwTTAoQ2TKV+LwzMaqa1rGMX2VESP8CCiV8XaYT+FjuuX7thvMb+ES?=
 =?us-ascii?Q?xtBPDgiUjbFOqcnewTA7fnd1PZWbWQ1Np1o7GvH782O8dWHIc9eXDkKvxq6e?=
 =?us-ascii?Q?+8XHymKpfCvAwVgOEck/MiYJ1h9V7hbwvtZc5ifY6Wdc49eTwJ2r?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3fc8ffff-cb94-4fdf-52c0-08defee15238
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2026 17:34:43.4242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GOjW/VmNBvGlFzcM2D38jlBTrruztuA2S1GVpKwjfjqwergp+DfxW1Xy8FuhDS4tVgI/GmQU1wdUfgxu7gHTFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB7644

Hi,

This is the first 10 patches from v5, split out following Frank's
suggestion:
https://lore.kernel.org/r/anzgNmxSV2vf1w1X@lizhi-Precision-Tower-5810/

This prep series converts the LL into a reusable circular ring and
prepares the doorbell and IRQ paths for the follow-up series,
"Support dynamic LL appends".

This series is based on dmaengine/next.


Notes
=====

- One temporary limitation caused by this split is that a descriptor must
  fit in the usable ring. Patch 4 rejects descriptors that exceed it, and
  the follow-up removes this limit once LL progress reclamation is added.
  See:
  https://lore.kernel.org/all/a62w2vkektwuksvz4oqkozqu27knzsqdroj7xprfm47twz5cs7@rd42oqapg5z2/
  Frank and I agreed off-list that this restriction is acceptable because
  a single descriptor with roughly 170 or more elements is unusual.

- Although this series does not append requests while a channel is
  running, it can still reduce per-transfer overhead by reusing the
  circular LL context: the driver no longer rewrites the link element or
  re-enables the channel for every descriptor. The follow-up can
  additionally avoid some stop/restart gaps by appending while running.

- dw_edma_core_ll_cur_idx() and dw_edma_core_ll_irq_clear() are not used
  until the follow-up. They remain here because this is a literal split of
  v5 patches 1-10.


Testing with this v6 (split-out prep series)
============================================

I tested this prep series on the following two testbeds:

- eDMA: RK3588 Rock 5B, DWC PCIe v5.60a
- HDMA: SpacemiT K3, DWC PCIe v6.30a [1]

1. fio

   The fio setup uses nvmet_pci_epf with a null_blk-backed namespace,
   runtime=30s, ramp_time=5s. The "Before" values reuse the baseline
   measurements reported with v2. The "After" values are three
   consecutive v6 runs.

   - eDMA (RK3588)

     Summary by group (BW delta %)
       all          n=26 mean=  +4.9 median=  +7.1 min= -33.3 max= +36.8
       read         n=14 mean=  +8.4 median= +10.2 min= -33.3 max= +31.7
       write        n=11 mean=  +0.7 median=  -0.3 min= -23.1 max= +36.8
       qd32         n=16 mean=  +5.3 median=  +9.9 min= -20.5 max= +31.7
       q1           n= 9 mean=  +4.5 median=  +4.7 min= -33.3 max= +36.8
       small 4K     n= 6 mean= +13.8 median= +11.9 min=  +9.6 max= +20.8
       large >=128K n=20 mean=  +2.2 median=  +0.5 min= -33.3 max= +36.8

   - HDMA (SpacemiT K3)

     Summary by group (BW delta %)
       all          n=26 mean= +21.5 median= +11.4 min= -23.4 max= +71.1
       read         n=14 mean= +15.3 median= +10.5 min= -23.4 max= +69.9
       write        n=11 mean= +31.0 median= +44.6 min=  -6.2 max= +71.1
       qd32         n=16 mean= +25.7 median= +13.6 min=  -8.3 max= +69.9
       q1           n= 9 mean= +16.1 median=  +7.0 min= -23.4 max= +71.1
       small 4K     n= 6 mean= +26.6 median= +16.8 min=  -6.2 max= +69.9
       large >=128K n=20 mean= +20.0 median= +11.4 min= -23.4 max= +71.1

2. pci_endpoint_test

   READ_TEST and WRITE_TEST passed with this v6 prep series on both
   testbeds.

[1] K3 was tested on an Ubuntu kernel with the prerequisite patches
    backported (+ some tweaks on top), not directly on the upstream
    base. The "Before" and "After" kernels differ only by this series.


Thanks for reviewing.

Best regards,
Koichiro
---
Changes in v6 (from v5 patch 1-10):
  - No changes.

Links to the original aggregate series:
  v5: https://lore.kernel.org/r/20260812155721.2807506-1-den@valinux.co.jp/
  v4: https://lore.kernel.org/r/20260729143036.3087722-1-den@valinux.co.jp/
  v3: https://lore.kernel.org/r/20260727170323.2321369-1-den@valinux.co.jp/
  v2: https://lore.kernel.org/r/20260723084150.521366-1-den@valinux.co.jp/
  v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/


Frank Li (3):
  dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL
    entry index
  dmaengine: dw-edma: Make DMA link list work as a circular buffer
  dmaengine: dw-edma: Move callback result helper before LL helpers

Koichiro Den (7):
  dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL
    control-word
  dmaengine: dw-edma: Factor out linked-list transfer start
  dmaengine: dw-edma: Dispatch DONE interrupts by channel request
  dmaengine: dw-edma: Centralize LL doorbell decisions
  dmaengine: dw-edma: Prepare LL progress event handling
  dmaengine: dw-edma: Prepare deferred IRQ reporting for LL events
  dmaengine: dw-edma: Prepare LL kicks for event serialization

 drivers/dma/dw-edma/dw-edma-core.c    | 341 ++++++++++++++++++--------
 drivers/dma/dw-edma/dw-edma-core.h    |  67 ++++-
 drivers/dma/dw-edma/dw-edma-v0-core.c |  59 +++--
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  59 +++--
 include/linux/dma/edma.h              |   2 +-
 5 files changed, 377 insertions(+), 151 deletions(-)

base-commit: 0d995da5fb97e8c312834575604d4423eb6225b7
-- 
2.51.0

