Received: from TYVP286CU001.outbound.protection.outlook.com (mail-japaneastazon11021110.outbound.protection.outlook.com [52.101.125.110])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125F8449B03;
	Tue, 21 Jul 2026 06:28:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.125.110
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784615303; cv=fail; b=Qej7V8/H+qNXSSwgo0PrAhDMmsdvProy5UFI3nbosf9L5HkRFD9ZnD/CI2Mvjaxk2IIWzki3yrx4p3vnCVjpDmtYVsL/zNsVzM6h3F3hSkbUnuzUhN7yG51ff/G2yIc8ixyuvw+9o/0VZkAaScjn9F51ZdKOASls0piZkGoP3GU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784615303; c=relaxed/simple;
	bh=VB8v4IMF3HF7CYbBtEPJ3uZ7AXxQmepgzfGQTAhGOk4=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LAXVKuInrdOv72cXZShY4/jNWsWfvnLUfpRvROzBZhI79IIa7p1JtDQ8pW//aEv4CbK9jXVBkMK7jvIXz//DFuXPa5ZPvm1DivKi8YKRCYZaZ0v2RCXgqrkEtZxGe3azva86TF2QpdPKfeKgozCk88lt2bA1ZtIa+BrCpN5B92w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=PnmNf5t4; arc=fail smtp.client-ip=52.101.125.110
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="PnmNf5t4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKYjvjiTk6F5VX2tP7iv8xUR+WBF2j/1HC6oafnQH/zEN40uB1LtlwVq8Y3wepq39Gv8b89zNhFqy7qBe8CWcxeauoI5Wg5ZLfM8Rp7a4YwAX7ncto6xc4Bd1GaHYPv+idfd13p3WnSjEN5dmhl3y/avOlqcBjfkVhWxMwaEv3spJ9YydxrndRIJtmecLpJ9oBXl4Y7JgmzSjDurD/Gw2PIdDt3aZ/aXpcD4sVIDVnArJovX+S6auGaKN+4DpKyVMGgPmGXnnAVAQCat64z3ldXgsawrc7CTRaOiuCbK0vZpeyN4RE9LDPlb42NGsy/Lsq8JXh2RkVZFiGyvyLPQ2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7jeI9yjdAZemMLocYdFvSTuNdnal3rqcHzMxKTrT0vc=;
 b=bxTW9S/qutxO5Bj5gN4/x9Zbqs28W2nirldkjvxYn+IudKGP/kdjJnVZodAOy0zZOVBFGI/o0SrNqsHhD/rPDGAeh7cr2LC6UbPK2JLm3ujmLP1cXotZ1BV/jFkQw5wIKXx3/rshCIr3wV59yRnco9YMJHIUndjaReniZnrQONUYBroNIDBHoIIXZNsl4ixs6RazUN3C+IMMfi+tsEd8MNQcqBMnsE+b5PMR3GEPZwTOpfB4HIi8jCn95lF5rbZki83sSYjkQjy9Ztkh0AAIs+Vo2tfrkf484fCZv63PZ2gcemMEwlbdyQMHMST00oPtxDDZq5+62ZDhUX/S3DCMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7jeI9yjdAZemMLocYdFvSTuNdnal3rqcHzMxKTrT0vc=;
 b=PnmNf5t4WN5ovJCHUEyccupLCIustTYG1jG+9+Y6aupNgr4oJcucQiZJpADyyIbDxrmHSm5AX4/z7/GFEOGbP95E66VKmiyXVgHKR7fdp5M5EsR3XYBG6w/u8tezwr+iGeIOIFTSB4kkg0oBwQE0zlv9jH1A/R2pmBbPrfVcCmk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by OS7P286MB6796.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:432::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Tue, 21 Jul
 2026 06:28:17 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0223.017; Tue, 21 Jul 2026
 06:28:17 +0000
From: Koichiro Den <den@valinux.co.jp>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
	dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 00/14] dmaengine: dw-edma: Prepare for PCI EP DMA (part 1/3)
Date: Tue, 21 Jul 2026 15:28:01 +0900
Message-ID: <20260721062815.4117887-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY6P286CA0003.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:3b8::17) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|OS7P286MB6796:EE_
X-MS-Office365-Filtering-Correlation-Id: 32776b72-f156-466f-32a1-08dee6f14076
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|10070799003|366016|376014|1800799024|56012099006|10067099003|6133799003|18002099003;
X-Microsoft-Antispam-Message-Info:
	4VN3xzV8eJM6MlYXu9xMTOfG1CMRVKuluCX8wf9tyPeK8++6y34NPKVuanEJP8AlnrxHbznSI6uqbUhLjS2XFmvL7vaU3e52O9hW9dwwjwYuu9hJ0xjxXRIfxUAXDLjeatJZLclmXG7PqMycEwu3/N3NpfuGqdkgPusAieqrhMsNQFf/ngc83P1ybpuYtASaJESuSfUZV3xom4zB7PNF/JUK+ZdOshub0eanOwljS+gKezayiYeEzDHLMSzxpvD8hBW1Z0eN1bCfDT+bzS1SyoZOzNCWNtsxmS5rfWamUj9U1sLVNnC8w+JJw0SvNxgxjgQpz07do5J8ZY9nMI1GBFt/W8ow/nQ8RGOy1jpRYKvxKpDGLUMm1MOYVMhKQUO9Pmr4I/h0oAUtVmMoKBBgXz6yEWWlRiV6BphFTAr7eLBm2SgQZAQAHtg0dqQdKQnFxC5QA3x8kiYaMQVDhc/ZvZie0v3SAhCtyV1X/AYk/YnrKbDsreOvyitOLtzcrteBvahjPspE9tH/nmoLLZJcfkadYMs2Kf0mFBjrJHE0TrbzY2mhS8aJ5XlcrtxztdcScT2P/r1akchg7MYoCcTCZg6vRy4pDaiYVtjrNAxBIEiM+40YHpKqhxiD0/2m3bFrm9Jmmolf+49lg8dd0vFA4TkI3+fKn9nkgfzgDG8dbhY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(10070799003)(366016)(376014)(1800799024)(56012099006)(10067099003)(6133799003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kPZHVhedJblXuX8NiEtaCf+FMuDn1hg9NiMogF2wsxpSthPyGmcBBetvY59V?=
 =?us-ascii?Q?vywzN2DbcWx5t5UALBwsH1vshXW1kiCnuTnQna1s8ICf9bchNpOrPGwKnBpx?=
 =?us-ascii?Q?EoL6ydUCmP/bvhiVMQG6l+kNPcW7XqNApy+HQmVmq04Y75XAdjWNMfUzV2Rd?=
 =?us-ascii?Q?Fn1B2qcZAMOyy5KD14MMTWl5XDCW04vqDbdsl/Zcphdz+zmedjNC1FCRkxqJ?=
 =?us-ascii?Q?3rRq3QmkhKLI8GXYLdVy0U1MjO1ThCn0cK37Qy3zlZPJ3MP1Ro2fVB1LcQ5X?=
 =?us-ascii?Q?6pzvWPvlemEUwXPW7+GldkmtpjlRLMuP/A3so+6T4d2BUyuVUs0qfmTwKzYv?=
 =?us-ascii?Q?+X4sxu/m0rQv+WCp4/4kn3beb7waDn3QonXTGZ/9WP4/DorrbccLcl5/Aph5?=
 =?us-ascii?Q?5RkPR1aKPiEkwGs48A5BfolMq62HNTniqqtv7/QY0XK639htv1iVoPkS5IWt?=
 =?us-ascii?Q?JsQNnPIOl0CGCMhpJEHh3ff4oAJKhWZY5vgWaJR8tFu+9jD4xY+ktg13WYvA?=
 =?us-ascii?Q?UgaXRH/aVHZkPuZpBe/54ENRB+qyuaplxvtjEQdbY+e+c+BzeOjKXU9ZQJVL?=
 =?us-ascii?Q?QNy5vEKrBscHHQ/wU9bJo+eNjdqbcqRHUf81iihG5PjgY3nC5CYjpc33MnF9?=
 =?us-ascii?Q?c1p/dquDR7p9qtSht8JQCE9NiB6eeOCxKZTXGcChAzNBPHTah3kXVFHXq+gd?=
 =?us-ascii?Q?HPBjWLx1xtSn+vWsT1VaEYRo2J7zMMQOExVhby900lQy7K1EPXY2dstPNFWL?=
 =?us-ascii?Q?FXrbdWbw1K2c8wh/BIxllnJsJ4fSMLbo3UOiB/Qm6+SV26cy+iAVt8zlfyte?=
 =?us-ascii?Q?LWK5nsGERZ43swt/YJIGOxJXhxpCMyDELfQjpxG30CEwUeJLTgt4RNJdbIuS?=
 =?us-ascii?Q?PJfMxBkdGUxaOqjT9hyXEmBIdFQ6oz2GYAM8Yog7zLWq0nAnX00G1cdBqzBx?=
 =?us-ascii?Q?XJX+H+1mEAUayo1v8FXoZG9rSdIHtMYB3tFMn5MY9MPq5bCqd0FusNxK/Xcu?=
 =?us-ascii?Q?scrRvbPbSdKgWnx8m18gJTaTv0R92IDFi3RvG/ZPFMsm1DJ5QCIuTHMYskqe?=
 =?us-ascii?Q?qUGdwqAQDha+LwsfoJVNmxfMGOs0YPxwf7ejYO6wTJeFetAFP56IeLH74RLF?=
 =?us-ascii?Q?fRQXNTwpvHODFHeySn1ONujrqVd+3VWs9YxclpzK9AuaIupIYUdSpntrfiNQ?=
 =?us-ascii?Q?5LzGct9ySEE/yNjsNRkUDMozdlxI0vRLR/37CBOkI5Jjm/HWAAmqSCE9OK6U?=
 =?us-ascii?Q?1Az085DiFPc49xYJJFUrtjQNqRvSN908phx/Mni867SXQv95FLOc4ZUNN38w?=
 =?us-ascii?Q?JsjSLCFhaBLGgYMx3DUFzYoHrobcqX/Ca3hDphvM3fFIYrxHTPVAYnlOWRrS?=
 =?us-ascii?Q?UAAPxab53r8ZY3H3/FbGn621u84slo84ss6yiwKZAJaXZpo5R8hoZIFny3qY?=
 =?us-ascii?Q?98gPyRDhwZUunTPPmWQmlqwdtdIL/q1rAhkUZYWonMvMCLp4NNsAHlB9p3IW?=
 =?us-ascii?Q?OzxYxzV2eukKWgxlU1TVFEOxDYsitlyx78g3FywStijH4GOmAQt8nHHJQbBn?=
 =?us-ascii?Q?6HPzlwtVMHX6ANlrf0dTpP22B7F8QgXCBvnx8mwPiM60TXYsjWPoKJdrlzTq?=
 =?us-ascii?Q?FOFF3Hf7ZCyyOGILDIxrDvoELnKrySAbi21kRDK5cxp0HjJhft5YwFluyjb7?=
 =?us-ascii?Q?QWM/Lm3wJ/JbCs7C4xUkE6TGgZect99tdrVL/XcaDtnTlukm5gFM74UzaXWN?=
 =?us-ascii?Q?wMNOLgA8OriCEpquhlCI8dWgin2CPtG8Oz3DDTdQQue58kZ+ZN7s?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 32776b72-f156-466f-32a1-08dee6f14076
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jul 2026 06:28:17.7332
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U5PlndMUeR8Tce55LR519Lv0wVp7+Ao8uAmt1XyPhbaGj8gy1xkfnooG6XvIPYOyWDsMPFOnz+1Yxs0EjBDrUA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS7P286MB6796

Hi,

This is v6, part 1 of three series for PCI endpoint DMA.

The three series are:

  * part 1: dmaengine: dw-edma: Prepare for PCI EP DMA
  * part 2: PCI: endpoint: Expose endpoint DMA resources
  * part 3: PCI: endpoint: Add PCI DMA endpoint function

This series prepares dw-edma and dw-edma-pcie for endpoint-local DMA
channels delegated to a PCI host. The generic PCI endpoint interfaces
and endpoint function are kept in parts 2 and 3.

v6 is based on dmaengine/next: commit 35de39e4511f ("dmaengine: dw-edma:
Defer channel IRQ handling to workqueue"), which includes the merged
dw-edma fixes and interrupt-path groundwork series, plus HDMA 64-channel
support. Parts 2 and 3 depend on this series.

Best regards,
Koichiro
---
Changes in v6:
  - Rebase onto dmaengine/next as requested by Vinod, including the
    merged dw-edma fixes and interrupt-path groundwork series and HDMA
    64-channel support.
  - Use the new base's mode-specific channel limits for partial
    ownership validation.

Changes in v5:
  - Rebase onto next-20260715, including Frank's merged
    descriptor-flattening series.
  - Wait for unrolled eDMA ENGINE_EN to clear on quiesce and use
    CHi_PWR_EN for HDMA compatibility mode.
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

v5: https://lore.kernel.org/r/20260717050308.2144108-1-den@valinux.co.jp/
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

base-commit: 35de39e4511f00a87f814b5f0afeb082a8fbc5d7
-- 
2.51.0

