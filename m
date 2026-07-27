Received: from OS0P286CU010.outbound.protection.outlook.com (mail-japanwestazon11021072.outbound.protection.outlook.com [40.107.74.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28BD942D75D;
	Mon, 27 Jul 2026 17:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.74.72
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785171816; cv=fail; b=m+GqYcIHf2oZ0gnXJ5a3fYstDZToWZ0FgmKdw/bCq/bzZsXfDnHjg5hmSwU+yWESJwqGZrCcKFXU1F4Vy+3ljuxeFFuQafne4V8c7CzU0mT5yZpwiPGzGxQzhLTJgfzmdW0QMbHYTWECAhYwVmEJOtRHX1vwbvB6nH1bbZzP5KM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785171816; c=relaxed/simple;
	bh=/e2WrkdA0GV1TW9WyzZpOHCXgcSYT8kzmYaMfRF+4qs=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=p5YkmUP7hsKiOp01s+wyDDX9a4rwhEogW1TmASVs2HKhEpk8Ge5boe2GRFvD0SC5befa4Y+mZ4F0L3/VJiWGdQxEeVxsUvzQzGp3SRpxKsde4Uv1jc74AJiCSDiH7Jvf+BIdGYisfJ/FZ12LCjm5Igdg/aGTN/v0/ao39tYhKbY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp; spf=pass smtp.mailfrom=valinux.co.jp; dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b=ZckZ4E3D; arc=fail smtp.client-ip=40.107.74.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=valinux.co.jp
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=valinux.co.jp header.i=@valinux.co.jp header.b="ZckZ4E3D"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h/8nO6hgXaoynTZFPxh/Bvu55yPERRjm/25NSyfLlqEEQmRRRaE2rY7LgHyHZolhYQGya+GlqIqtMJKY1/MTpAR1OJdj3yVWW9GFTAeYVyhRqSuOSIP92wJ9tBrBS+CKvZJZ0jJ91R98ryKQ5EA5XDZc1PwDo4caTsRC5VZf9QT2FwFug3sQf6ZnhyJzLde9WjC/XhKyV5w1eWEhtRjtO+G1IlpxyWWGtzq3NJu31iCer+HbTVXNO14YKFmxRVPsoZ1W5N5TA3ndd+QoJdTKo5KLl2eNRzCn5x6kuhtIodPfLUWj3NemD1tQmKHXFX5DRTLk4sRHYo5PklnG25bpEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+OCNsdIJLPDYdodq8cWNkvO+k13/Tkv9jdsRuQ/Oja4=;
 b=wgPqyEgXrXpXCoZuI0Pl1UGmd6Y+F0JWBZU1/Fn4UKSH8S3ZX1hh7g+9CkNYtW+gzHQgXT5JCjQHY9J88cuDozBpW17dXZkmRrNNObGjUXv+p+lZ7+9GO8WZjm4RZW1Mf1z0+LfeK9LkJ2F3k3CCXik+xddxJOItVgJ3rgpy3tgOy+kEUl7GTNHTIqIRWci6IP9pzi5+R86GfRyyMp+pDkJRY/8bSw98GzkqK5OIcJwcJ9Mif3GiMfbjH8hoIJpLWRip5+UPf3rAShh/Ng/kFzZLasyEjsHAWv3uuzZP44B7i3S1BGZ4T4wjmS+da8xA90MzR2au1wllYgW4FJu/Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=valinux.co.jp; dmarc=pass action=none
 header.from=valinux.co.jp; dkim=pass header.d=valinux.co.jp; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=valinux.co.jp;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+OCNsdIJLPDYdodq8cWNkvO+k13/Tkv9jdsRuQ/Oja4=;
 b=ZckZ4E3DjI3h1nUP7ImWSxAvxWtlZLdg5rhlKxJMiyWB8NBdK342O/bEHA4hJ0r9UQ1+94EmQncxT38xopIymsK4xB+qNtKWtODiKeU7DzX38oKPPXf9uxg78Ke4BEId+2PwP4UVYCZdphq5qh2nCnRRDMLsAui8oppAk2wASVw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=valinux.co.jp;
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:38f::10)
 by TYRP286MB4609.JPNP286.PROD.OUTLOOK.COM (2603:1096:405:1a9::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.223.12; Mon, 27 Jul
 2026 17:03:31 +0000
Received: from TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32]) by TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 ([fe80::2305:327c:28ec:9b32%3]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:03:31 +0000
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
Subject: [PATCH v3 00/24] dmaengine: dw-edma: Support dynamic LL appends
Date: Tue, 28 Jul 2026 02:02:59 +0900
Message-ID: <20260727170323.2321369-1-den@valinux.co.jp>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: TY4PR01CA0124.jpnprd01.prod.outlook.com
 (2603:1096:405:379::6) To TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:38f::10)
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY7P286MB7722:EE_|TYRP286MB4609:EE_
X-MS-Office365-Filtering-Correlation-Id: 3900c570-bb11-41b6-5f59-08deec00fc3b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|1800799024|366016|376014|23010399003|10070799003|18002099003|10067099003|56012099006|921020|6133799003;
X-Microsoft-Antispam-Message-Info:
	T5Yh/cCAufTSArF8NZhzjxEWlHbpXkSQMc8Vko2YIQ7k5mFB7gXkI2Ppk0GoKJI3yws2GFFFF/WSUtOQwjeoMnttxJ3rPgyZMLfwoNDkLX8V14VE5RIS6l5wfJHuj+nONbR6LKzfBsf/ritHZdVV82WUOABge36CeKKoLWcELOARCjaWjXbmEV36Q8dfpJlwM0pK2zyz4rvDpSQ40CQQH0cbcW0EUca2938BPxN5UdEtyKT8o7ZoO8wIE0/CvEkpj1esy65zSYztIrQFrCGRDGa6kVSLYQRY8xBXwMpQDYNOOgleTLh9y0rTDxwg44gd7OybwuhtAirtmXHKeGv/zYxkrNSlMGoJjwcboZL0Qr/PUcg+bnhLYT4Vw2nOYMay9c206JuvUJNmtm8G6VgdLCq6vupQXiLt7DGWtt/SWOFezHbyJESHRRYYNR7CEtTVrkAYnI+wiEKBA6H/Tidjeg0nc3jjh8F8M1u5VbWkR9DTg+GBlH1pVijyFIUkNcDXd0zx7pyhj6xOOVEkLuljFxGdIowFweMG1wi8dJSk2ITuoJIzIkUqk19ihsFuzE45t3OtTiBDG4nEkrOqSmhrDaaExWY4h5LIaTs+d5uekPsd6eskJXLYUQkyUU5KfTsYDArl7rNRUgaf7gFj9s/evwWF1k46KETHaPUwiBb19E09wwFFIsH4SRxDj56JFSAs7SQ8Xwrk77Momp0E/kbMKQ==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM;PTR:;CAT:NONE;SFS:(13230040)(7416014)(1800799024)(366016)(376014)(23010399003)(10070799003)(18002099003)(10067099003)(56012099006)(921020)(6133799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?KuC965xfdTbQ8R0QTy90kKJWlag7xFJ4t7hYWj/gvhXZvO/qZnC6qmvpouxO?=
 =?us-ascii?Q?Z/BBc5SOFYmmDU1cu+BvN6wIJqXL4PciWQLAJWPHxk1roHvscp5BNiEYBiKs?=
 =?us-ascii?Q?bOltJrW+XtKiGSu5PgwSmElIOypiArMxYgUEDREEUZpsLvLTeEsCsCY1Ux4m?=
 =?us-ascii?Q?dzrLp3dxIBLYzzSVen8kPHavKNOjq/QzpZGrbPrl4prqKUlkFqd2OF3w77Hv?=
 =?us-ascii?Q?Cv7rQao0FriS/iIoVofC2+3vT6HOIIHOt+tAgCZos6j5Ru31KWbivpZ3b2Lc?=
 =?us-ascii?Q?eKPTfjC9zXZhho0505ZGD9s17aVOlnXrCDDw7Js9aKMoc1kUVIVhblBfG/aB?=
 =?us-ascii?Q?S+Auc3eIxL6HuETg3YyJ2zI1RcadTlBcTysvxKgN5a4UIlkhJC6tlqc17kjN?=
 =?us-ascii?Q?3gQs7xystkNgsECZao16HYc/GXkVO3aY/s67fgL1/CS+NUEYpfllc0W2aWZX?=
 =?us-ascii?Q?Ry1Bc868K4SEepaGOw0vj4qGtdkTxweFD1KtdPXgI17msf18sK9HaV0gd26I?=
 =?us-ascii?Q?Pkwbz+/IVIn+Wpb3u4zSGDmi5lYE3pC+mSx7J+Hap3du2K4GZ9acC02OOGA5?=
 =?us-ascii?Q?Zw9agB0h5VGsjv8dEc6pZIUrPygRJDKDHTdOXeW+PfWiiDws3jBDOojCtTzy?=
 =?us-ascii?Q?AVxMAcOrfVzqR/bSSZzMudTWP2KBwCeETK+aug85tMx653TvV8ACEqSaD8SP?=
 =?us-ascii?Q?C22I2poXHT/Phf+rjWCdntE2sX2jmwyCdm/BAIqFet68yTayZnAeBKK7x5PV?=
 =?us-ascii?Q?wN4NZnk38ovlW9MzNqJhx7DrEoZyFCMPYIQUgAfDc6dbDtINekWkp0Xn30cD?=
 =?us-ascii?Q?D1BKneZkjjG4B4M99gHBdzwrNwQF/t4Ry3P2HaQUJRJYX8CPtRZxfqcSPRt6?=
 =?us-ascii?Q?XobGNo5kpxO+NupdG4PyISPwdStsVypSlGMTI33Ww5ixXlcW8n3wK8fadcLD?=
 =?us-ascii?Q?31oWfY+IRZoRutu0Ooyv0Cnykt+i4ZnIAIidiG+QRosIWQIlqBF2PjPQJr8/?=
 =?us-ascii?Q?gUWUwipmZ3jnY5ZTbGlyRVyGzZ1FYmdQAOGv9NO8d4f6gxBYrFPd9GcD3//j?=
 =?us-ascii?Q?eRKNxEx12JjZYhALtTVAhMa5N/gpTK0uToxP6+k/+0bDlruANqsiHyPs4aco?=
 =?us-ascii?Q?q07v6djlav3fZjJcFKZrTJMlv1vAGiwCT4ZU7yos9A9LNoSa2aX0NiEAOom4?=
 =?us-ascii?Q?qCeKHRmg/87299OetzRwtR2YFZnNeDCisa+SG04zZkM6tgSUmxH2riLml+3Y?=
 =?us-ascii?Q?oEb5q/N1E8QpFZMV5kpra+O6c7i3tAvhu930Ps3e3w/PvlsrDwpHRkXLiRV5?=
 =?us-ascii?Q?dp7Pwrle7AcKu92NZO/wkNiZ/u6IDXtAdH66ZT7a/p+rZL1detHpeYR04VOH?=
 =?us-ascii?Q?SAuGbz5ESISpRaM0lVEY6RJLJu51W46BvNdIY/A4IO40yQ0F2CF9JsUDREQM?=
 =?us-ascii?Q?c/SbgX4tmuJ04TnqQS1x7DjBkySamGIZiOf/2jwVVzcFyqyE4gzkE1QhZjvy?=
 =?us-ascii?Q?aPMII/touwFHL1gnPGjs9u0YL3tt/LA0qWU6ZIyD82+2op3rN06UchqdO8HP?=
 =?us-ascii?Q?7I5VOBKojF7v/2sNH6rS49JmOnphyQOHmQxuRkVh+dK4gLcXdLkmMZXjEpTs?=
 =?us-ascii?Q?e5m2WmF1LGvHXviCOqSZdCfeRbaaZX0VmDEx7PaxKT+znjw6kfZ0PQdXW+wJ?=
 =?us-ascii?Q?35bVcE1TReTAB5Jfh2P0uAKE5C5WAXiZqxdHpWEbUlJfWJ/n68bVHwW3N5uJ?=
 =?us-ascii?Q?Fj5fustyedVI2nv+3ayBgv+fe7d1KYjo1KhPDwNa+s939TNhgWqv?=
X-OriginatorOrg: valinux.co.jp
X-MS-Exchange-CrossTenant-Network-Message-Id: 3900c570-bb11-41b6-5f59-08deec00fc3b
X-MS-Exchange-CrossTenant-AuthSource: TY7P286MB7722.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:03:30.9849
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 7a57bee8-f73d-4c5f-a4f7-d72c91c8c111
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fOLaefSzpGxw4D/MUtf9GyhGT0En0F3BPsiDWEI9BfAXMKTupk2e1l/o1A+82ZbDL21ptFyn9OzMJyLCq9lJww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYRP286MB4609

Hi,

This is v3 of the dw-edma dynamic-append work originally proposed by
Frank Li in his RFT:

  https://lore.kernel.org/r/20260109-edma_dymatic-v1-0-9a98c9c98536@nxp.com/

The driver currently treats each linked list as a finite transfer and
waits for completion before publishing more work. This series turns the
list into a circular producer/consumer ring and lets LL channels accept
new requests while running.

The motivation and hardware observations are unchanged from v2, linked
below. v3 mainly addresses the review feedback, especially the
event/restart races reported by Sashiko.

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

This series is based on dmaengine/next.


Re-testing with v3
==================

I tested v3 on the following three testbeds:

- eDMA: RK3588 Rock 5B, DWC PCIe v5.60a
        R-Car S4, DWC PCIe v5.20a
- HDMA: SpacemiT K3, DWC PCIe v6.30a [1]

1. fio

   The fio setup uses nvmet_pci_epf with a null_blk-backed namespace,
   runtime=30s, ramp_time=5s. The "Before" values reuse the baseline
   measurements reported with v2. The "After" values are three
   consecutive v3 runs.

   NOTE: The fio tests use nvmet_pci_epf, which does not keep the DMA
         engine continuously busy. A workload that rarely lets the
         engine stop would show the benefit of dynamic appends more
         directly.

   - eDMA (RK3588)

     NOTE: The eDMA Before results include the separate regression
           described in [2].

     Summary by group (BW delta %)
       all          n=26 mean=+1135.8 median=+122.1 min= +39.2 max=+5358.8
       read         n=14 mean=+2006.2 median=+903.7 min= +51.6 max=+5358.8
       write        n=11 mean=+105.6 median=+111.3 min= +39.2 max=+176.8
       qd32         n=16 mean=+1783.3 median=+174.6 min= +72.1 max=+5358.8
       q1           n= 9 mean= +79.5 median= +58.2 min= +39.2 max=+202.6
       small 4K     n= 6 mean= +99.4 median= +78.3 min= +39.2 max=+176.8
       large >=128K n=20 mean=+1446.7 median=+126.8 min= +47.8 max=+5358.8

     Before mean -> After mean (MiB/s)
       Case                         Before             After              Delta
       ---------------------------  -----------------  -----------------  ------
       Rnd read     4KB q1  1j          19.2 (sd 7.5)      29.2 (sd 7.2)   +51.6%
       Rnd read     4KB q32 1j          88.7 (sd 2.1)    152.7 (sd 58.7)   +72.1%
       Rnd read     4KB q32 4j          88.7 (sd 1.3)    163.7 (sd 78.0)   +84.5%
       Rnd read   128KB q1  1j       420.0 (sd 134.6)   685.0 (sd 123.2)   +63.1%
       Rnd read   128KB q32 1j        142.0 (sd 37.7)   2547.7 (sd 40.7)  +1694.1%
       Rnd read   128KB q32 4j         63.7 (sd 10.6)   3027.0 (sd 27.6)  +4654.5%
       Rnd read   512KB q1  1j        572.0 (sd 35.8)    943.0 (sd 19.5)   +64.9%
       Rnd read   512KB q32 1j         66.8 (sd 10.8)   3021.0 (sd 25.1)  +4422.5%
       Rnd read   512KB q32 4j         55.4 (sd 12.0)   3026.0 (sd 28.1)  +5358.8%
       Rnd write    4KB q1  1j          20.7 (sd 7.0)      28.9 (sd 2.2)   +39.2%
       Rnd write    4KB q32 1j          42.5 (sd 0.9)    115.7 (sd 19.1)  +172.4%
       Rnd write    4KB q32 4j          41.7 (sd 1.6)    115.3 (sd 19.3)  +176.8%
       Rnd write  128KB q1  1j        330.0 (sd 90.1)   520.0 (sd 105.5)   +57.6%
       Rnd write  128KB q32 1j       624.0 (sd 111.5)   1318.3 (sd 63.8)  +111.3%
       Rnd write  128KB q32 4j        659.3 (sd 61.8)   1304.7 (sd 67.0)   +97.9%
       Seq read   128KB q1  1j        260.7 (sd 25.8)   788.7 (sd 142.0)  +202.6%
       Seq read   128KB q32 1j        149.7 (sd 30.9)   2551.7 (sd 96.7)  +1604.9%
       Seq read   512KB q1  1j        578.0 (sd 32.2)    914.3 (sd 10.1)   +58.2%
       Seq read   512KB q32 1j         65.0 (sd 10.6)   3025.3 (sd 22.0)  +4554.4%
       Seq read     1MB q32 1j         57.3 (sd 18.8)   3037.3 (sd 23.8)  +5200.8%
       Seq write  128KB q1  1j        272.3 (sd 62.0)   626.7 (sd 159.9)  +130.1%
       Seq write  128KB q32 1j       597.0 (sd 105.7)   1318.0 (sd 64.1)  +120.8%
       Seq write  512KB q1  1j        476.7 (sd 26.7)    704.7 (sd 23.0)   +47.8%
       Seq write  512KB q32 1j        710.7 (sd 44.0)   1305.7 (sd 59.3)   +83.7%
       Seq write    1MB q32 1j       546.0 (sd 100.4)   1220.3 (sd 57.7)  +123.5%
       Rnd rdwr  4K..1MB q8  4j       247.3 (sd 16.3)    947.7 (sd 84.5)  +283.2%

   - HDMA (SpacemiT K3)

     Summary by group (BW delta %)
       all          n=26 mean= +89.8 median=+103.3 min= -30.3 max=+182.9
       read         n=14 mean= +80.4 median= +79.2 min= -30.3 max=+182.9
       write        n=11 mean= +97.3 median=+138.1 min= -25.0 max=+151.5
       qd32         n=16 mean=+117.3 median=+117.3 min= +67.8 max=+182.9
       q1           n= 9 mean= +35.5 median=  +9.6 min= -30.3 max=+151.5
       small 4K     n= 6 mean= +95.5 median=+117.3 min= -17.4 max=+182.9
       large >=128K n=20 mean= +88.0 median=+102.0 min= -30.3 max=+151.5

     Before mean -> After mean (MiB/s)
       Case                         Before             After              Delta
       ---------------------------  -----------------  -----------------  ------
       Rnd read     4KB q1  1j          52.5 (sd 3.5)     43.4 (sd 17.4)   -17.4%
       Rnd read     4KB q32 1j        108.1 (sd 90.9)    305.7 (sd 30.9)  +182.9%
       Rnd read     4KB q32 4j        117.0 (sd 84.9)    308.3 (sd 30.6)  +163.5%
       Rnd read   128KB q1  1j       835.7 (sd 139.6)    582.3 (sd 84.1)   -30.3%
       Rnd read   128KB q32 1j        802.7 (sd 67.7)   1619.3 (sd 31.0)  +101.7%
       Rnd read   128KB q32 4j       931.3 (sd 262.1)   1628.0 (sd 45.9)   +74.8%
       Rnd read   512KB q1  1j       411.0 (sd 144.0)   831.3 (sd 187.5)  +102.3%
       Rnd read   512KB q32 1j       969.0 (sd 210.7)   1626.3 (sd 44.7)   +67.8%
       Rnd read   512KB q32 4j       889.7 (sd 298.0)   1634.0 (sd 52.8)   +83.7%
       Rnd write    4KB q1  1j         46.0 (sd 15.5)     50.4 (sd 13.6)    +9.6%
       Rnd write    4KB q32 1j         117.7 (sd 4.0)     250.7 (sd 0.6)  +113.0%
       Rnd write    4KB q32 4j         113.0 (sd 5.3)     250.3 (sd 0.6)  +121.5%
       Rnd write  128KB q1  1j       606.7 (sd 149.0)    520.0 (sd 65.5)   -14.3%
       Rnd write  128KB q32 1j       533.6 (sd 512.3)    1270.7 (sd 2.5)  +138.1%
       Rnd write  128KB q32 4j       526.0 (sd 514.9)    1271.0 (sd 1.0)  +141.7%
       Seq read   128KB q1  1j       626.3 (sd 247.5)    811.7 (sd 45.9)   +29.6%
       Seq read   128KB q32 1j        783.3 (sd 51.1)    1600.0 (sd 4.0)  +104.3%
       Seq read   512KB q1  1j       464.0 (sd 191.5)    992.3 (sd 20.0)  +113.9%
       Seq read   512KB q32 1j       918.3 (sd 241.8)    1600.7 (sd 1.2)   +74.3%
       Seq read     1MB q32 1j       918.7 (sd 290.5)    1603.0 (sd 1.0)   +74.5%
       Seq write  128KB q1  1j        611.0 (sd 79.8)    458.0 (sd 15.7)   -25.0%
       Seq write  128KB q32 1j       521.8 (sd 515.3)    1270.0 (sd 2.0)  +143.4%
       Seq write  512KB q1  1j       328.3 (sd 268.7)    825.7 (sd 35.9)  +151.5%
       Seq write  512KB q32 1j       519.6 (sd 516.6)    1271.3 (sd 1.2)  +144.7%
       Seq write    1MB q32 1j       515.1 (sd 517.8)    1268.3 (sd 1.5)  +146.2%
       Rnd rdwr  4K..1MB q8  4j       355.3 (sd 64.7)     846.3 (sd 2.1)  +138.2%

2. pci_endpoint_test

   READ_TEST and WRITE_TEST passed with v3 on all three testbeds.

3. R-Car S4 (PCIe Gen4 x2, DWC PCIe controller v5.20a, eDMA) stress

   The non-upstream NTB transport/netdev saturated four HW channels in
   each direction concurrently from multiple QPs. With v3, it still
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
 drivers/dma/dw-edma/dw-edma-core.c    | 1557 ++++++++++++++++++++++---
 drivers/dma/dw-edma/dw-edma-core.h    |  163 ++-
 drivers/dma/dw-edma/dw-edma-trace.c   |    4 +
 drivers/dma/dw-edma/dw-edma-trace.h   |  169 +++
 drivers/dma/dw-edma/dw-edma-v0-core.c |  201 +++-
 drivers/dma/dw-edma/dw-hdma-v0-core.c |  164 ++-
 drivers/dma/dw-edma/dw-hdma-v0-regs.h |    1 +
 8 files changed, 1994 insertions(+), 267 deletions(-)
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.c
 create mode 100644 drivers/dma/dw-edma/dw-edma-trace.h

base-commit: 0613e7934ee233d726af8d8c89f251a1c4df738d
-- 
2.51.0

