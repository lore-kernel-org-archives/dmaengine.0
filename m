Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021140.outbound.protection.outlook.com [40.107.74.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C44440C5D4;
	Thu, 23 Jul 2026 08:42:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784796155; cv=fail; b=uyjMhamlhMxTEYpIDw/SXSqGnJGOt9hFcnZWlZ36nZZRS88v1Yzg/LDTgVngm1UTffg6vCtMqgudRU8+nIWNMVeWtBHiwyUpsjzc7j9kWY+rQXdnuxcL0AhdgcODLZ3in+5TIbTIEkzhXDNqRkRGZoMPGU8ZCynL6qwNVlBH5is=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784796155; c=relaxed/simple;
	bh=vcUv67jSTxNk2qdybLUg/gdrGtDXi3ab39PrYCMb0hQ=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=KmgXsr0AeGlOLS8+90eRjK5Qw7gRyIHEbDT9I8xfohYyljU8fY9Wky3WcMT/7PqKm7mC5kAyeJWXu/zNdPbaxOTEmULBMMWUeUy1vlzc2qSCSli6AAPY4SSiW1aoUWnCIZSuItdStSJ1RIosKtNba58SD5fZQ0OvNTmoRJeuhqI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=up5JsB5k; arc=fail smtp.client-ip=40.107.74.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="up5JsB5k"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HHB/zfsgAF8oaCszMcUIcUgSaxriUSpP4LdAoSUfMnaHH3uW86yLjZlGwxk93FDosZ6gv4kr+kIZLFpkXf+Q83KNDLVK/z572ppfGQ+WYLd3asGFERdYwbcAyjl9/VhFvI6KnwpUYuIKgL+EHyjEAKBRbdMjHOCwQaFXQMoIueCLTuI7XkrlH5T9s9n9T75E7p1kEvU2j6ufVq9ZuYCmrgTiNJx920cg9Im7isjQ4sL1Rcs/BrnbNNPBchUOMxOp2Ryb1GEU8YrAdPhc/XdJbKGXbTIU6mhCK0KWnZBdJNbXGFkvfaOvMBdHPO1ORAcEeYb/oym/vT5zrXGrnMJI5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vRRxRM2OhVA7xbfl75YkCk4HZgjdyJpdpAnEiPZOIHc=;
 b=nkF7KwVqrtHCXZu5vtlFH5OF1TvfMKA/8sUzZBYtqrqQHOGH433oaex75IkV6RW3he8xDPbrIC9/eTWBZbbh6wYXux19Jz37GSPPL+80DschMPIEyvFLOleBUXGIOIrrFLPSJfFlctFidSskSLeTgUfQbcrE834POcI0wUGgafaWYgJI8wELxZ0Ty18XgV68H7Z8n9r/Lx9hOANZZtgXR1pTCWORz0Yll8Ylz1Su8t3gNxij6/R4OJP/Au8CZ0RjpUr1o2h32R6pxeyd7DxczIcbi/8pX3qmRb668z6W/rpbSJIlgvvwrhanLKHBL9flrAQqkvteh4O6WeBTJv7k8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vRRxRM2OhVA7xbfl75YkCk4HZgjdyJpdpAnEiPZOIHc=;
 b=up5JsB5kVBuga9sP0fngzMMdZsq6DyRQzpdW+d/TxS/TU1I6YcV8PB9zIpzF3ggPjJ3XQPE++IVvfdOP7i2ecd8McaCQ3DtgGx0Sek6zMH8ni+oa9+CCH8/rSrAc99YgypAKtr3dbwY3F9Wut1BIeprP08ngexQyP9973NvYSJg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS9P286MB6486.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:416::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Thu, 23 Jul
 2026 08:41:56 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.009; Thu, 23 Jul 2026
 08:41:56 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Manivannan Sadhasivam <mani@kernel.org>,
	Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
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
Subject: [PATCH v2 00/19] dmaengine: dw-edma: Support dynamic LL appends
Date: Thu, 23 Jul 2026 17:41:31 +0900
Message-ID: <20260723084150.521366-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P286CA0011.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:26d::11) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS9P286MB6486:EE_
X-MS-Office365-Filtering-Correlation-Id: e5d426d5-fd27-4eea-a69b-08dee8964094
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|366016|1800799024|10070799003|23010399003|921020|13003099007|6133799003|10067099003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	MeQiKmjJx9vIsd9Yoz7u9r7Ae0mbUN/d/ALKXr/owAx/C89rBNPohbzuqITsWkZj8+ntLBE4O80D9jv9GFdISBQ6io9ohZwdZzpmBKs6+UdffhwMIp6brML5ShnlpL8Uh0YuTLg7hhPN1M7QZJt/nbTEFsW/txj4sB+rYAvnVU/1T4e12fqWJe0XDc2bwOSoDbLKQWo8kcszi3C9QOrqGd/sYs7Pdpcq5QnAJbx/wKG+hF1bIb+mIgzBV1KPxa258fL+y2R6rYEWHk87KDK9Ze9gLNBNKtPdmcjLHYMI565qruxOi17FMKRNo5DUBJDVqj7dPk65X7bv6fo2hVsLbswbvDmf+koKynicSRlr+hCHIrjIDIXJMEIIECcLnIZKRehGfqhE0IX5NfzM8RRq6ZrXRmoEwTTLm2BgorqrZqPNXbncpJmVyhCMnQt4jB6Dfu/Th/GuS4Q/m/X/IRTHLE0UzU9YRspD2X+fhcGdJ8I12c4exLEzbV5MAGXapbgmGNf7Cer+EGgqSYRkPNaAoqBh1h/D/Zyg0ksFwz88ihUBoKqPOVHlHCkyymX9xPvVEvUyrccAReVH7VgrRnr4nf2K9QEUFvdPI6uTSaCSvXcjwMBy6kGcCFK7rYYqtxgy1dhFSiV6E3Vn7zGM4CFN+3LhTXde+dgs+DGMA1BoFMfAPiz1UNHCdr0x0NA7iQry7eyAbYhyGFmIlXf9Rf8LzQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003)(23010399003)(921020)(13003099007)(6133799003)(10067099003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?4cDmAFsU96vfTqyLZYs62v36RGABz6XlK0gT2GVcRSDt9ud5NMLtagD4vXAz?=
 =?us-ascii?Q?ICLBDzMFGKwZQoxm7xD1r3CkPTaW7Qio8PKkiX6PJtuiu+bBDj7bO/SmvNZq?=
 =?us-ascii?Q?yXjqwlMZMTx9n17KwcdSKH6krtv56S2arIav3JFZBL4O88RPW9+uwQQMXxYV?=
 =?us-ascii?Q?Ce7xD2i3DJHC+r1eJJ/iuPYjRGsOrA8kVhs9yXftSgNTJ2ZlWq7JsVMBadjV?=
 =?us-ascii?Q?eWV/LE8e9NW2GfX6f/SrUSD333jFudBS8NmPESvdE1VFzzpbYazPXnVKF6Xu?=
 =?us-ascii?Q?VYmuTr8bX6PmR1mWv19IFSGcLoT3YkcjWrz6aFkvpRNrR19d2AiAYEc8cN4N?=
 =?us-ascii?Q?cSVnt2gF8xp1661pFeBJuuK9BhQCNinbd6jBfrd+eT1ifz9yjwBpTLtRY98U?=
 =?us-ascii?Q?1iDN50WwFGBLkyYNr4e5azDJGbtf+2OT/adqftCsWHjcdUFw2msYFS6Ruh1M?=
 =?us-ascii?Q?A8uU3qEyIbgt9Mod7EBvHmAVylqouF00gFX1YXOFwMmy+LUBJH/7fr27GhtU?=
 =?us-ascii?Q?lvBT5ANNaBJ/x9640p7f5jE0HVlWNhiQAApWHOSgMQ5igv5yM9hS7xcCCy05?=
 =?us-ascii?Q?Yvl6VqczHDsAzTCIzmi3JYu5nWeKweEuZdPUqsnI0cn0sCbxwN4KtLu+XT9a?=
 =?us-ascii?Q?QPUMyxj3flx2tkV/Vyhti+BcxIMaIrMfF6KT1Kh2YM9cEBlZxwXCp105d+W2?=
 =?us-ascii?Q?hiJLfiXZJQIm2asHqIv4KKRR+9ErP7BLb7fPddM40U5lePf22oxTO4TmFkv4?=
 =?us-ascii?Q?zehP1wewKxLkxwqFMg+HvPnlpCznj4U+x/q6oOSUmpXIjfH/vBtOvrhcDDvV?=
 =?us-ascii?Q?WolHu+qj9ZfmX7ISWexbPADryFgfW9YMlSKAdDfRxgcmb+o1qIiUi7SSrUuT?=
 =?us-ascii?Q?WqrVD51n7QedChSnWTooZUNaLQVKFc2UHLgrc1VIh1f7AHg+s40LLSZJCvF5?=
 =?us-ascii?Q?MhNJSa2KuqZGD281+NmdL0BDkQF5UXULs4svAyT4grAibMz7hejGci3YMDmQ?=
 =?us-ascii?Q?GtRnC3/c0b5tTinZdI6jV4k5Y3WtkAPAox0zZps5um8hCWyHs5DUg1SdrMwj?=
 =?us-ascii?Q?BN+oCaMHTI7LwgOv+ZwMSrcwZYTM7goH6jOZZZYU3dPM5U4q7mtABMTsx0eN?=
 =?us-ascii?Q?5FFeIA5v5aZMH6KHgMRAy+0YNElE0RqnsurpQ77GGtOOi2RWuxR5w5w+8S0q?=
 =?us-ascii?Q?d11XpTAjWcmrwZwJu7A5Rbhi3+iGDkl5dkn8jLOjVldft+cjgIl3nlkkNou7?=
 =?us-ascii?Q?gPU80UEbOVCNst4F7zDRXPQmtDnTnSM7Az6f6w+obyg92bvA6LhJruupM1WP?=
 =?us-ascii?Q?fJYJF3HP/orcvUT01RG3ZOO3QJwgEpA3V4HWWqyUneqEAU4RLZUKAHr7kdX5?=
 =?us-ascii?Q?41hNLiksjcjGelmh+jZLjRCKQSQ9cBm0QLLbmfnW4F0r8iX7aakc0nffZhU3?=
 =?us-ascii?Q?AItKlEXkurUFvcgw8/KA6UeNSVm1ou2mHuwO91WhkECVrQVRzL+T8UEPoH+V?=
 =?us-ascii?Q?JAhpI6UpTuDKRxeBzgqZY5Wb4HHky5+jZcF4V8XKFbMZnpWawn4e96XaBtvU?=
 =?us-ascii?Q?UMi3VSre2H9F61xns0WOs8nRsuAe6Vwk9E6CcJt3ffzjwcOymq5dBgq3w2CO?=
 =?us-ascii?Q?weMak0GqJzXnbz6K05SsBBx5ISe5/9lBcqLfxPF81H2bke60vmspGXyELkyI?=
 =?us-ascii?Q?oeGX8xEzCgnNzf+YmcbAXOiGmaJ3JTdeEPvGjtt23rvavIgt9BqLG6do+6kp?=
 =?us-ascii?Q?I76L4A6MZW1SyHzw343ViQRJpIAOJ84yl/AzuIb44FXK3UzZ693W?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: e5d426d5-fd27-4eea-a69b-08dee8964094
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2026 08:41:56.0751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fURQ7E8v+SFpOLLZPM6YObs6HAc+QPAlJpyhARVJooG3/7PkhFz4mboVdfcpXjV9C4AydUlnUp+WhYvLsOTggQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS9P286MB6486

The existing driver treats each linked list as a finite transfer. It
waits for completion before publishing more work, so short and concurrent
requests repeatedly stop and restart the channel.

Turn the linked list into a circular producer/consumer ring and allow
new requests to be published while a channel is running. The hardware can
then continue into newly published entries instead of waiting for
software to rebuild and restart the list for every transfer.

v2 incorporates the v1 review feedback and a substantial rework based on
failures observed under intensive multi-channel traffic.

  v1:
  https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/

  Frank's RFT:
  https://lore.kernel.org/r/20260109-edma_dymatic-v1-0-9a98c9c98536@nxp.com/

Why this is more than a ring change
===================================

Once entries from several DMAengine descriptors coexist in the ring, LL
ownership and descriptor completion no longer share one boundary.
Software must recycle entries as the hardware consumes them, but complete
a descriptor only after all of its entries have been consumed.

DMA_LLP provides that progress evidence, but its meaning depends on where
the channel was when it was sampled. A stopped sample points to the next
entry. A running sample can move ahead of payload completion, so keep it
one entry behind. Although the HDMA databook describes a watermark LLP as
a recycling boundary, testing on a DWC HDMA 6.30a integration showed that
using it directly for DMAengine completion let clients release mappings
while the hardware still accessed them. The series therefore records
IRQ-paired LLP samples and uses the same conservative running boundary for
both eDMA and HDMA.

A running channel consumes newly published entries without another
doorbell; a stopped channel with pending entries needs one. The series
keeps that decision in one helper, together with stopped-tail
reconciliation, so publication, completion, and restart use the same view
of the ring.

Recovery
========

The programming sections do not define how a second legacy-eDMA doorbell
is handled while a start or stop transition is still in flight. Register
traces point to two problematic transition windows. Channel Status can
still read STOPPED while a start from an earlier doorbell is in flight.
At the other end, DONE, STOPPED status, and zero transfer size can all be
visible before the internal stop has fully settled.

A doorbell aimed at an apparently stopped channel is suspected of
arriving while the previous start or stop transition is still in flight
inside the engine, leaving the channel stuck. The channel retains pending
entries but reports no progress or error interrupt. The exact internal
trigger is not known, and these observations should not be taken as a
rule for every integration.

Avoid doorbells while a channel reports running, and route every stopped
restart through the common helper. Since the visible registers cannot
prove that an apparent stop has fully settled, also provide an optional
recovery path. Repeated doorbell-path checks detect pending entries
without progress. Recovery gates the direction, waits for active channels
to stop, resets the engine, rebuilds configured LL contexts, and only then
enables it again. If ENGINE_EN does not clear, the direction remains
gated.

The recovery path was never entered during the fio/nvmet_pci_epf runs
used so far; whether much longer runs can reach it is unknown. It is a
safeguard for the intensive multi-channel failure, not part of normal
operation. The first stalled observation only starts the timeout and
still rings the doorbell. Recovery is queued only if a later check, after
the timeout, still sees pending work without progress, and the worker
revalidates it before reset.

Only the eDMA provider currently opts into direction recovery. Native HDMA
does not provide direction-reset operations, while HDMA compatibility
mode has no ENGINE_EN. The recovery trigger and timeout remain empirical
and need coverage on more integrations, as well as confirmation of reset
semantics from Synopsys.

Series flow
===========

- Patches 1-6 establish the circular ring and its interrupt policy.
- Patches 7-14 make progress accounting, completion, STOP/PAUSE, and ring
  reset work with multiple descriptors in flight.
- Patches 15-17 add the optional engine recovery path.
- Patch 18 enables dynamic submission; patch 19 adds tracepoints.

Base
====

This series is based on dmaengine/next: commit 0613e7934ee2 ("dmaengine:
dw-edma: Program endpoint function numbers")

Testing
=======

I retested v2 on the following three testbeds.

- eDMA: RK3588 Rock 5B, DWC PCIe v5.60a
        R-Car S4, DWC PCIe v5.20a
- HDMA: SpacemiT K3, DWC PCIe v6.30a [1]

1. fio

   The fio setup uses nvmet_pci_epf with a null_blk-backed namespace,
   runtime=30s, ramp_time=5s. Before And After were alternated three
   times (B-A-B-A-B-A).

   NOTE: The fio tests use nvmet_pci_epf, which does not keep the DMA
         engine continuously busy. A workload that rarely lets the
         engine stop would show the benefit of dynamic appends more
         directly.

   - eDMA (RK3588)

     NOTE: The eDMA Before results include the separate regression
           described in [2].

     Summary by group (BW delta %)
       all          n=26 mean=+1202.7 median=+157.0 min= +55.6 max=+5551.2
       read         n=14 mean=+2086.1 median=+893.9 min= +62.3 max=+5551.2
       write        n=11 mean=+157.4 median=+130.1 min= +55.6 max=+356.8
       qd32         n=16 mean=+1871.7 median=+345.2 min= +99.6 max=+5551.2
       q1           n= 9 mean=+110.0 median=+108.7 min= +55.6 max=+165.2
       small 4K     n= 6 mean=+220.2 median=+163.2 min=+151.4 max=+356.8
       large >=128K n=20 mean=+1497.4 median=+139.3 min= +55.6 max=+5551.2

     Before mean -> After mean (MiB/s)
       Case                         Before             After              Delta
       ---------------------------  -----------------  -----------------  ------
       Rnd read     4KB q1  1j          19.2 (sd 7.5)      51.0 (sd 9.5)  +165.2%
       Rnd read     4KB q32 1j          88.7 (sd 2.1)    231.7 (sd 17.0)  +161.2%
       Rnd read     4KB q32 4j          88.7 (sd 1.3)    223.0 (sd 38.2)  +151.4%
       Rnd read   128KB q1  1j       420.0 (sd 134.6)   876.7 (sd 325.4)  +108.7%
       Rnd read   128KB q32 1j        142.0 (sd 37.7)   2701.3 (sd 56.2)  +1802.3%
       Rnd read   128KB q32 4j         63.7 (sd 10.6)   3121.7 (sd 27.3)  +4803.1%
       Rnd read   512KB q1  1j        572.0 (sd 35.8)    963.0 (sd 48.1)   +68.4%
       Rnd read   512KB q32 1j         66.8 (sd 10.8)   3097.0 (sd 24.8)  +4536.2%
       Rnd read   512KB q32 4j         55.4 (sd 12.0)   3132.7 (sd 39.3)  +5551.2%
       Rnd write    4KB q1  1j          20.7 (sd 7.0)      52.4 (sd 8.2)  +152.9%
       Rnd write    4KB q32 1j          42.5 (sd 0.9)    194.0 (sd 24.2)  +356.8%
       Rnd write    4KB q32 4j          41.7 (sd 1.6)    180.7 (sd 12.7)  +333.6%
       Rnd write  128KB q1  1j        330.0 (sd 90.1)   600.3 (sd 133.7)   +81.9%
       Rnd write  128KB q32 1j       624.0 (sd 111.5)   1426.3 (sd 43.7)  +128.6%
       Rnd write  128KB q32 4j        659.3 (sd 61.8)   1410.0 (sd 49.5)  +113.9%
       Seq read   128KB q1  1j        260.7 (sd 25.8)   690.3 (sd 184.6)  +164.8%
       Seq read   128KB q32 1j        149.7 (sd 30.9)   2578.3 (sd 60.5)  +1622.7%
       Seq read   512KB q1  1j        578.0 (sd 32.2)    938.0 (sd 46.9)   +62.3%
       Seq read   512KB q32 1j         65.0 (sd 10.6)   3106.7 (sd 21.6)  +4679.5%
       Seq read     1MB q32 1j         57.3 (sd 18.8)   3110.7 (sd 27.1)  +5328.7%
       Seq write  128KB q1  1j        272.3 (sd 62.0)   626.7 (sd 144.1)  +130.1%
       Seq write  128KB q32 1j       597.0 (sd 105.7)   1425.0 (sd 42.5)  +138.7%
       Seq write  512KB q1  1j        476.7 (sd 26.7)    741.7 (sd 25.4)   +55.6%
       Seq write  512KB q32 1j        710.7 (sd 44.0)   1418.7 (sd 47.7)   +99.6%
       Seq write    1MB q32 1j       546.0 (sd 100.4)   1310.0 (sd 39.9)  +139.9%
       Rnd rdwr  4K..1MB q8  4j       247.3 (sd 16.3)   1068.7 (sd 13.7)  +332.1%

   - HDMA (SpacemiT K3)

     Summary by group (BW delta %)
       all          n=26 mean= +89.0 median= +97.7 min= -18.9 max=+152.9
       read         n=14 mean= +78.2 median= +84.0 min= -18.9 max=+145.5
       write        n=11 mean= +96.9 median=+121.6 min=  -0.1 max=+145.0
       qd32         n=16 mean=+114.2 median=+112.2 min= +73.5 max=+145.5
       q1           n= 9 mean= +37.1 median= +18.7 min= -18.9 max=+121.6
       small 4K     n= 6 mean= +87.2 median=+106.8 min=  +8.6 max=+145.5
       large >=128K n=20 mean= +89.5 median= +91.9 min= -18.9 max=+152.9

     Before mean -> After mean (MiB/s)
       Case                         Before             After              Delta
       ---------------------------  -----------------  -----------------  ------
       Rnd read     4KB q1  1j          52.5 (sd 3.5)     57.1 (sd 16.3)    +8.6%
       Rnd read     4KB q32 1j        108.1 (sd 90.9)    265.3 (sd 74.2)  +145.5%
       Rnd read     4KB q32 4j        117.0 (sd 84.9)    273.0 (sd 80.0)  +133.3%
       Rnd read   128KB q1  1j       835.7 (sd 139.6)    678.0 (sd 67.5)   -18.9%
       Rnd read   128KB q32 1j        802.7 (sd 67.7)   1651.3 (sd 11.0)  +105.7%
       Rnd read   128KB q32 4j       931.3 (sd 262.1)   1685.3 (sd 12.7)   +81.0%
       Rnd read   512KB q1  1j       411.0 (sd 144.0)   799.7 (sd 243.1)   +94.6%
       Rnd read   512KB q32 1j       969.0 (sd 210.7)    1681.7 (sd 9.3)   +73.5%
       Rnd read   512KB q32 4j       889.7 (sd 298.0)   1684.0 (sd 17.4)   +89.3%
       Rnd write    4KB q1  1j         46.0 (sd 15.5)     56.4 (sd 21.3)   +22.5%
       Rnd write    4KB q32 1j         117.7 (sd 4.0)    236.3 (sd 46.3)  +100.8%
       Rnd write    4KB q32 4j         113.0 (sd 5.3)    240.3 (sd 47.9)  +112.7%
       Rnd write  128KB q1  1j       606.7 (sd 149.0)   606.3 (sd 139.3)    -0.1%
       Rnd write  128KB q32 1j       533.6 (sd 512.3)   1263.0 (sd 40.4)  +136.7%
       Rnd write  128KB q32 4j       526.0 (sd 514.9)   1263.0 (sd 40.9)  +140.1%
       Seq read   128KB q1  1j       626.3 (sd 247.5)   743.7 (sd 145.5)   +18.7%
       Seq read   128KB q32 1j        783.3 (sd 51.1)   1658.0 (sd 12.5)  +111.7%
       Seq read   512KB q1  1j       464.0 (sd 191.5)   855.3 (sd 147.2)   +84.3%
       Seq read   512KB q32 1j       918.3 (sd 241.8)    1681.7 (sd 9.2)   +83.1%
       Seq read     1MB q32 1j       918.7 (sd 290.5)   1688.0 (sd 12.5)   +83.7%
       Seq write  128KB q1  1j        611.0 (sd 79.8)   624.0 (sd 152.8)    +2.1%
       Seq write  128KB q32 1j       521.8 (sd 515.3)   1261.7 (sd 41.7)  +141.8%
       Seq write  512KB q1  1j       328.3 (sd 268.7)   727.7 (sd 127.6)  +121.6%
       Seq write  512KB q32 1j       519.6 (sd 516.6)   1262.7 (sd 40.1)  +143.0%
       Seq write    1MB q32 1j       515.1 (sd 517.8)   1262.3 (sd 39.8)  +145.0%
       Rnd rdwr  4K..1MB q8  4j       355.3 (sd 64.7)    898.7 (sd 43.0)  +152.9%

2. pci_endpoint_test

   READ_TEST and WRITE_TEST passed on all three testbeds.

3. R-Car S4 (PCIe Gen4 x2, DWC PCIe controller v5.20a, eDMA) stress

   The non-upstream NTB transport/netdev saturated four HW channels in
   each direction concurrently from multiple QPs. It reached EP->RC 18.7
   Gbit/s and RC->EP 15.7 Gbit/s with iperf3 -ub0, while keeping the DMA
   controller almost continuously busy.

[1] K3 was tested on an Ubuntu kernel with the prerequisite patches
    backported, not directly on the upstream base. The "Before" and
    "After" kernels differ only by this series.

[2] During final testing, I found a separate performance regression
    associated with commit 35de39e4511f ("dmaengine: dw-edma: Defer
    channel IRQ handling to workqueue"). In a spot check, reverting it
    from the eDMA Before kernel raised 512 KiB random-read QD32
    throughput from about 67 MiB/s to 2370 MiB/s.

    The large eDMA deltas above are therefore not the standalone gain
    from dynamic appends. They also reflect that queued transfers can
    continue without waiting for the deferred IRQ path to restart the
    channel. A separate fix for that regression is under investigation.

Best regards,
Koichiro
---
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

v1: https://lore.kernel.org/r/20260615154111.2174161-1-den@valinux.co.jp/


Frank Li (5):
  dmaengine: dw-edma: Add dw_edma_core_ll_cur_idx() to get current LL
    entry index
  dmaengine: dw-edma: Make DMA link list work as a circular buffer
  dmaengine: dw-edma: Move callback result helper before LL helpers
  dmaengine: dw-edma: Dynamically append requests while running
  dmaengine: dw-edma: Add trace support

Koichiro Den (14):
  dmaengine: dw-edma: Add dw_edma_core_ll_clear() to clear LL
    control-word
  dmaengine: dw-edma: Factor out linked-list transfer start
  dmaengine: dw-edma: Add LL interrupt placement policy
  dmaengine: dw-edma: Dispatch DONE interrupts by channel request
  dmaengine: dw-edma: Centralize LL doorbell decisions
  dmaengine: dw-edma: Reclaim issued descriptors from IRQ-paired LL
    progress
  dmaengine: dw-edma: Use HDMA watermarks as progress events
  dmaengine: dw-edma: Reconcile lost completions from a stopped LLP
    re-sample
  dmaengine: dw-edma: Recover stopped channels from tx_status()
  dmaengine: dw-edma: Make the LL ring reset a full channel resync
  dmaengine: dw-edma: Reset LL state after terminate and abort
  dmaengine: dw-edma: Add engine reset and enable operations
  dmaengine: dw-edma: Add engine recovery infrastructure
  dmaengine: dw-edma: Detect and recover a stalled eDMA engine

 drivers/dma/dw-edma/Makefile          |    2 +
 drivers/dma/dw-edma/dw-edma-core.c    | 1069 ++++++++++++++++++++++---
 drivers/dma/dw-edma/dw-edma-core.h    |  104 ++-
 drivers/dma/dw-edma/dw-edma-trace.c   |    4 +
 drivers/dma/dw-edma/dw-edma-trace.h   |  187 +++++
 drivers/dma/dw-edma/dw-edma-v0-core.c |  122 ++-
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  141 +++-
 drivers/dma/dw-edma/dw-hdma-v0-regs.h |    1 +
 8 files changed, 1497 insertions(+), 133 deletions(-)
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.c
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.h

base-commit: 0613e7934ee233d726af8d8c89f251a1c4df738d
-- 
2.51.0

