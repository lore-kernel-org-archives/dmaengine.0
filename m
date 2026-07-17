Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021140.outbound.protection.outlook.com [40.107.74.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FC072609DC;
	Fri, 17 Jul 2026 05:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784264599; cv=fail; b=lYmhMRgMCWR2AHhHcZ2pChfB5/ZmCp/gp4EvrSSPxNIIsT3zyTFFDTarRi5286wZojM3LlN78jSZ2yyUl1T+8a0RO6MT8ncBdz9d4J8sbr2p3Y9nCGIJiZOpmENO5rFKzfpLSHVoepW4jMQSzueVnGNedpGebZ6LjJckCx9z2T0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784264599; c=relaxed/simple;
	bh=rW+sRoTXIq3ISABs6gJGHXYlVzj2cRDXInpsKYZ4hSU=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=UFNK8+lZ8WpEqH5ffU1KjbcRbvIAoW0hn0DpjBj/zS1cmIeScI41ZJGZXYgf6YW+euiF9gGu4A+eN7Imd2wpeFzXuAQaKed41iGQ8FlEsypLtCAh8qx1g7+jX9d30Gmys7Ck6CNdp+apo+e7pUl5opjGfzveGoIW6SNf+IKcmho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=r7tAOfib; arc=fail smtp.client-ip=40.107.74.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="r7tAOfib"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CvUO3g4SB7Uwrplyp7tqQGZbnJE1XygwTxP22AGm9vMZKGtAQTfnbzXe+MU/u1noa2bakWQaJ/WSz1FdmBbML9qMq1bneNJ2TVNIYYAZMRUPb4ug4h/44dVgqlJE/yWcJBLlwro06fySNG/xoXffW/46FAcamVOxny6umVAAa/oGjgIAOcoyqgUCAZfwIQXL2tYsoYbC5gFbTq+qYxlbDntOuSJ4scV8Yjbae0gfrnLvIiRLR30ZooQGqhZgKpxSsGfPsJ+/TRW2Mn9TzRfu9I+eCmofZr4OhntciABoHEV9geUeKYVB06XqXIa51lfO6oPLqKWViUzmv7gZ2+idGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JjE6R6VUij/iqN2yTdF9dNNEiBiLzMkz+JukRPnIYoE=;
 b=H0Z2pPTyVqHTNOZZXvLR5FcsPN29fOjS8LLpJRoh6/zixoMvRqKGqqqSUjpBvhyGurEaM5Z0xG67EnTgCTuLYwxy8Sr7aJYesHJVJGG3PmnPPxztBrbgsqn2fyvO6R7wyYsfsqp10y4WE/ZCciD69rRYTBwxwDKG24RI/hhMUWfb3TJsu6OriFbZHlj5HYSW8C2flxM0b6uVKMCQNwjptgcJHLEz959PWtGOlfOxGu0bm6t3F0QgVDKd/04wpltWpMYHb1exV6Ff6Ez1GxCnjWQ9y+pT7YPkV1g6vbN8efeVEaSZAKBdZFO73uckUKDv3Jb2vJMc71tLFc8JyuLOLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JjE6R6VUij/iqN2yTdF9dNNEiBiLzMkz+JukRPnIYoE=;
 b=r7tAOfibwg/Ko2bzVLEgszoqQ6rD2P0lrbkUMWmc9CUh3wT8gYmt8bU4PJS7ZDMtKDUmueik1F7udBcbFnf+5ZR1GTNGY6xSjtNS4Y2V/1l7YDEMP3L3TGy7b4el0S4qorvRsHRlqtiihLOv2naSUjzBJ75BOf1e1lwZtmK4xBE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TY4P286MB6313.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:33a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Fri, 17 Jul
 2026 05:03:14 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.008; Fri, 17 Jul 2026
 05:03:13 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 00/14] dmaengine: dw-edma: Prepare for PCI EP DMA (part 1/3)
Date: Fri, 17 Jul 2026 14:02:54 +0900
Message-ID: <20260717050308.2144108-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4P301CA0092.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:405:37a::16) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TY4P286MB6313:EE_
X-MS-Office365-Filtering-Correlation-Id: 648aa6f4-7ac7-4377-dede-08dee3c0b489
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|10067099003|6133799003|56012099006|18002099003;
X-Microsoft-Antispam-Message-Info:
	eLOC4Hw98pgtehlDdTZusl9EsZWXFlCQsxISWR9OdugUWPjvFijXEjfKLccvlFH0zFuq88xyhasiOOF0+WQlDqet5sdKK273a1x+3SGDd3dTSgatR/klCKBK45s2h/q26u9XYx1G5zAYsgRD1yis/kwJOfEfApQz0NWJRUg5ZryLWPza3MqRE8TUVAP/4/qpao4Uu4R6HnFOujucQqV+izq+NFL580qaeUgTBL6w9kGb+yq1dkXaD4uobTTxrZ7tcg12OlWtk+ggoy3F+u12EjZTaV66KtrdZBMFmUxNtJ8X2EFfsk8R8EkD09bVwU8+UbWxwi7S6b2PaTxLmHXrjZXj0xqIOty/q1vSeU1Ezz9cj6/qgpKDt6MwQPHcHne9iXNhylQ7093wKV3cNZ7nms/4dW2epIx75S9ry154DGzHnkDGEwsT4x3na7ffUTx/Ct+2mSOg/MJyfl24Dy2zSXVb1XGEC3GXtepjWDo6JzTCmioz9iFCRbOhXiYLFoEEMDDqT8aqveRfxQ4ESo4xid3l9nj8VvpHuBe257JnPz5TwbE2cBKye1VTM/PRyPrrdWjPmJ8z9uXsC0XbwJGmpOes09xft60Gwy/NiEm+rX0G8qXLcY72gz+YKUSZkupiU55SMExxTOUL86oRSJVClWPLPXemBulCcmr9N4vuqH4=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(10067099003)(6133799003)(56012099006)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7MAqEBsk3NeEDbvQLxZdW6kcKZvOFQSOb/kLVbVIJuh/dT8IXu4Kn+JFBfpz?=
 =?us-ascii?Q?9JeocjlOm/FY/hzAeb9ac+8nHgO00jWLgm2oWiYRjmN6XqHexDxOAcLrdHWZ?=
 =?us-ascii?Q?zbBIBJYNoMokMAt7eyI0mhMHw95DqdcXpCpEoX0+ukC81OJO9urg5+jCdVSM?=
 =?us-ascii?Q?LdO2fW0zTXkYAoQxJCIevMUZPnSyZ05FrCsHGma02SdDGnJUQTsnmFsHxUZ5?=
 =?us-ascii?Q?9m+6RxBneTk3FOlKzqXz0MtXSx61gUZuG0ZcVxK1ATOLg6ycp7Sz0V4vJF5o?=
 =?us-ascii?Q?wZ+AoOIlgJ1JBphM5+KNW5unGQ6E4BAnuD6vzE/roHs5fkp+nFDt6bph+HZP?=
 =?us-ascii?Q?HLigqqqikLaGRgHLjKAw7CGeiVlzBymT7pXZG8Ry2nOvQGk5A1rf9D9aLll8?=
 =?us-ascii?Q?J5BKw2Sy3AKHDcDktojoY7L3T0uihrIZqjROHTeRF/dUwg1dBqLX+nysr/9o?=
 =?us-ascii?Q?d5A9xJQe77l0jxX4B4uvSWaesmVX3UJtSooTBz8QuvUlCT8NEecpSObKeExw?=
 =?us-ascii?Q?ezWF88rYKqsuw53VUy1SRB357C6fJh79717RexFw+maMusuY7Gh+YCIVQz1m?=
 =?us-ascii?Q?IVW33h9Rk98SNginpJ/A5IkG5oG2UKsu5UETO6HU670nZaawLLgN1NLY1JlA?=
 =?us-ascii?Q?zLQrRwmfPxnQ7MwzJL29dwXgxiMD8UNnwPylhViYvVHnPVnOOAIxRCr7UOOC?=
 =?us-ascii?Q?frTp33yc5wGEN35BiQMopqyCpXWQ/dIvYjHBzVOsp99bdwMV5ot9I2eV7Hkn?=
 =?us-ascii?Q?sHwOqyFYi1Quo/ABXHcfJ5qO3Bw/xXebpCMIogWqT5aPbT1DS6DRsvU8wsCx?=
 =?us-ascii?Q?pvhYFRXpiwspvpulRyt5jLhoTz/jkFThvQgxFsK2Bel7wkPkMA67ZldeUWRs?=
 =?us-ascii?Q?iUtawkGxtgaXyT/mAzEGdRrdjyCnUMNUVz1tHFqkr7v47GzHHoqZmvhfK4nQ?=
 =?us-ascii?Q?wUuqw4qH70WvEvn+nO8T7LjI5r7BTNrkrQZyDksIJFpxTKH5keSXZV8cp+N1?=
 =?us-ascii?Q?kj2Vg3v2aCiorA/YLDieRaB/QpBjDPqUEW0B1MfekAMsRxAOHacmEri9XOOi?=
 =?us-ascii?Q?Vo2wv4C44szl72gwAdSGX8saSNOU2QO/yfdBAui9UR2z7rgdc0mvn1iue+xJ?=
 =?us-ascii?Q?QizqJZCNS28SCkG9ZT30Azj532jPnbEgjkTaK4Q34Xi0BziqZl4+0Enf4aYM?=
 =?us-ascii?Q?efijKYIFvS+httJCI4uYrTC1BWyUri8FCYlSIdt10oEdhgbIngkcyT753tbd?=
 =?us-ascii?Q?VTxMi1Ar5g4dFLatPlYHez2AfYw/qtQrZYeE7wS76IhtrGyLjuRAccYFwNCC?=
 =?us-ascii?Q?xzcPsb8pdYAUUuHi1Nv8CT19cDq0ObIQDCE9zSQYsP5RA7WRS4p4B2DU1RHc?=
 =?us-ascii?Q?ac+le9cvMBzqlZd6z4rsQOKArG87NiE//Zo/5XVWXu561LnuXzK1rKJKlplU?=
 =?us-ascii?Q?2qpc4OdYSzaxqWODYW/gVbwh1SoFI68l+VkGgr1D4MCZQoiUeDWzXYgyWz+Q?=
 =?us-ascii?Q?THAouru0znAgY3b+xomaG/rCIcc/gndd12/b2K3qRteu6DH0JEi7sI9vZauz?=
 =?us-ascii?Q?BleLB+gwHNokE/aos7WEgHyZMScVm1k4+vKMDYdRcx+EUIRrXnhdXfIZ+8LS?=
 =?us-ascii?Q?8Xp8GllACkCm+W5Y5TghujYIWEslZBrFXdtp4pM0MHTVvziisjiVbmWNld55?=
 =?us-ascii?Q?tY+keXUv6G3HgVXI8V7Oi3NWAL2u94OqbZnvbsazvDTTu8sUQmMi4Hh+vJMv?=
 =?us-ascii?Q?qzeRDN+NdUMj6Tp8sicjFDvxPYnQGZNYjOJ8TQcBhTphammjL7Bl?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 648aa6f4-7ac7-4377-dede-08dee3c0b489
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jul 2026 05:03:13.7367
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mV412sN7MmujTDCUfrl8/vGD2GxVyI53MUIU5XQFztHIPZq3GMero5+kA6Uv+oiGMml+sX+pLmS5ffp86wPavg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4P286MB6313

Hi,

This is v5, part 1 of three series for PCI endpoint DMA.

The three series are:

  * part 1: dmaengine: dw-edma: Prepare for PCI EP DMA
  * part 2: PCI: endpoint: Expose endpoint DMA resources
  * part 3: PCI: endpoint: Add PCI DMA endpoint function

This series prepares dw-edma and dw-edma-pcie for endpoint-local DMA
channels delegated to a PCI host. The generic PCI endpoint interfaces
and endpoint function are kept in parts 2 and 3.

v5 is based on next-20260715, which includes Frank's merged dw-edma
descriptor-flattening series. Parts 2 and 3 depend on this series.

Best regards,
Koichiro
---
Changes in v5:
  - Rebase onto next-20260715, including Frank's merged
    descriptor-flattening series.
  - Wait for unrolled eDMA ENGINE_EN to clear on quiesce and use
    CHi_PWR_EN for HDMA compatibility mode.
  - Keep HDMA LSIE/LAIE set for STOP/ABORT status latching and mask
    the local interrupt pins in remote mode, fixing a v4 regression.
  - Use min() for partial channel count limits. (Frank)
  - Collect Frank's Reviewed-by tags.

Changes in v4:
  - Rebase onto v7.2-rc1 plus the dw-edma fixes/groundwork series:
    20260710080903.2392888-1-den@valinux.co.jp.
  - Split the HDMA interrupt setup helper out as a new first patch.
    (Frank)
  - Rework the routing patch per review: default-irq-mode naming and
    call sites simplified, chip->irq_mode dropped. (Frank)
  - Revise the partial-ownership patch: message fixed, validation moved
    into dw_edma_check_partial(). (Frank)
  - Move "dmaengine: dw-edma: Add delegated channel request helpers"
    into part 2, next to its only users.
  - New patch "dmaengine: dw-edma: Program endpoint function numbers",
    so channels delegated to PF1+ issue TLPs attributed to their
    function; this also lifts part 2's v3 PF0-only restriction.

Changes in v3:
  - Replace the public dw-edma hardware-channel filter API with delegated
    channel request/release helpers, keeping the DMAengine filter private
    to dw-edma. (Frank)
  - Rework IRQ routing so local routing is the zero value, existing
    dw-edma-pcie instances stay remote-routed, and delegated endpoint-local
    channels are handed to the remote side explicitly. (Frank/Sashiko)
  - Add HDMA native interrupt routing and allow channel-granular partial
    ownership for HDMA native.
  - Add quiesce operations and use them for delegated-channel reclaim and
    partial-owned remove paths.
  - Reintroduce the IRQ data initialization fix because partial-owned probe
    skips the core_off() reset that previously made the early-IRQ window
    unlikely.
  - Adjust dw-edma-pcie match-data preparation for the CPM6 entry present
    in the new base, and reject dynamic PCI IDs without match data.

Changes in v2:
  - Move non-LL state and platform ops into match data. (Frank)
  - Use a named .driver_data initializer for the Xilinx MDB ID entry and
    fix the vsec_data rename patch title. (Frank)
  - Replace the dma_get_slave_channel() export with a dw-edma channel
    filter for dma_request_channel(). (Sashiko)
  - Rework the IRQ-routing config as dw_edma_irq_config, keep HDMA native
    int config separate, and reject remote IRQ mode on local instances.
    (Sashiko)
  - Report IRQ_HANDLED only for status that was actually serviced and drop
    the lockless free_chan_resources() reset. (Sashiko)
  - Tighten partial ownership: reject unsupported map formats early and
    require direction-wide ownership for supported shared-register
    layouts. (Sashiko)

v4: https://lore.kernel.org/r/20260710081518.2394357-1-den@valinux.co.jp/
v3: https://lore.kernel.org/r/20260620170040.3756043-1-den@valinux.co.jp/
v2: https://lore.kernel.org/r/20260525062420.3315904-1-den@valinux.co.jp/
v1: https://lore.kernel.org/r/20260521063115.2842238-1-den@valinux.co.jp/


Koichiro Den (14):
  dmaengine: dw-edma: Factor out HDMA interrupt setup helper
  dmaengine: dw-edma: Add per-channel interrupt routing control
  dmaengine: dw-edma: Add core quiesce operations
  dmaengine: dw-edma: Initialize IRQ data before requesting IRQs
  dmaengine: dw-edma: Add partial channel ownership mode
  dmaengine: dw-edma-pcie: Track non-LL mode in DMA data
  dmaengine: dw-edma-pcie: Add capability match data
  dmaengine: dw-edma-pcie: Rename vsec_data to dma_data
  dmaengine: dw-edma-pcie: Add platform ops to match data
  dmaengine: dw-edma-pcie: Add register offset match flag
  dmaengine: dw-edma-pcie: Factor out descriptor block address lookup
  dmaengine: dw-edma-pcie: Handle optional data blocks
  dmaengine: dw-edma-pcie: Add chip flags to match data
  dmaengine: dw-edma: Program endpoint function numbers

 drivers/dma/dw-edma/dw-edma-core.c    |  95 ++++++++--
 drivers/dma/dw-edma/dw-edma-core.h    |  28 +++
 drivers/dma/dw-edma/dw-edma-pcie.c    | 253 +++++++++++++++++---------
 drivers/dma/dw-edma/dw-edma-v0-core.c | 181 ++++++++++++++----
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  77 ++++++--
 drivers/dma/dw-edma/dw-hdma-v0-regs.h |   1 +
 include/linux/dma/edma.h              |  41 +++++
 7 files changed, 531 insertions(+), 145 deletions(-)

-- 
2.51.0

