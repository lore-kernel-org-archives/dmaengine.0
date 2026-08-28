Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010020.outbound.protection.outlook.com [52.101.229.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9FFD36E49B;
	Fri, 28 Aug 2026 15:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787929893; cv=fail; b=GhzPyciWtAVqq0FQqA727arACZ+HzxPWddbe9VF0ksvDzLAUWA0p1weNuOIEWE/0suf+y6Y735Lzp12KwH1CbsjfZTiHPePr6P69OfxVkC2jziV8/3Yk7Q+aLX0SKT+SA6qMr6QegiJl+TC7UYeTkifVYi2O2E4i0V+peFFSiIY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787929893; c=relaxed/simple;
	bh=eHc7PwISImydJTemRTkQnIF2EgFY+GKkc3amWIpQy64=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Fc2QQxGaJrbWnd/FKGOCj6Ryax/AJCzsmZTm4+M6M0SKbV9roohCWYk8ZVOtKMv3XcyFsN496Qg8epm4XReZA9x2JrZDiKTu6nU9lPXyKd5Qzo/09MF/E45Y3Oh15BnunhLhkvSO9Sg09W9YrVhnTHMNKQqhcu+Cts5i3FYTU3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=l4H+wSvv; arc=fail smtp.client-ip=52.101.229.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="l4H+wSvv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZmmCeNvxfgAU6lKNGYX0FCqxoLXPjM7WmBcWIUTVe+yqAfWYjwQXMCETF2r1q8x5IEI1G0+wbCb/c7FGqdEPa+iUQdTKo23c6wSTZAF+wGfTzQuRkdw8OePYhZ4tdNoJWZPxAno77bgvrJiHA1kNw1D9Y8W9rp0sJYzsCv10gBIi7YipDJou9CIKe1E8y65ZoiWXgiSvHMlRZVaBx/eD8nU40Qywse8O04YwSO4dGpoMES3JF2g9RGs0hMWvhP3lQz+fdoWSxyA9bL0S/fo6VOXgG4GzjhZ0yAQTmt3DySBy6dUiqWk/10v1XEImZrQYVIKJZiRLiSrDLoS6MiXEAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9YWwAG66g4/5kprFAgwLoUWD1q0j+qw6AqWV+HnWtQ0=;
 b=oR4r7Tox0BnlvitBP0LYTrHWanUNwCdK/P5mYL1iG30BbqNvtrVavf93+7xXj45Y9HlilvlL+7RVC5h7KWHthq0fY049tPIc11q2t7TMlN+PT4OejS/ORMpJP8nkppDVUcVZbgP9Cm+epOuRSvrm9dP/imEVtvvkl4anyPMfk+aWbav2s7cayFvCrFzRoggRfkSrArXxWRBY2trf8LENW/oSqxU+qRI8PiOlglRefW8lHJojDOblthMSW/+/cObuiZoKxH3ijXV3iagTShn6NsF02PN1qkE6uljth1owLIkyPmkd5NDc4EU5Ry9fIBA5iH6vqxfF7nhVbCRYkAq4uA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9YWwAG66g4/5kprFAgwLoUWD1q0j+qw6AqWV+HnWtQ0=;
 b=l4H+wSvvxSnzA2EMP0+o33GMrSkhgHWJ4vzPR5aewy7cJxbsQi9bobk6jEzvZKdPL7Pz535or1VRVHHjsKSktugkVkhVTKBZYPi44WfPch+Q81mbbTr9BtoeB925S4nfQLOTvb2AnD63raJDxDOY2F6h9rrT4rK00dDvbp7Qbug=
Received: from TYWP286CA0019.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:262::6)
 by TYCPR01MB11621.jpnprd01.prod.outlook.com (2603:1096:400:3b8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.360.11; Fri, 28 Aug
 2026 15:11:26 +0000
Received: from TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:262:cafe::a5) by TYWP286CA0019.outlook.office365.com
 (2603:1096:400:262::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.360.11 via Frontend Transport; Fri,
 28 Aug 2026 15:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005621.mail.protection.outlook.com (10.167.240.52) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.382.8
 via Frontend Transport; Fri, 28 Aug 2026 15:11:26 +0000
Received: from demon-pc (REE-0055761.adwin.renesas.com [10.226.92.7])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 9F41530001E6;
	Sat, 29 Aug 2026 00:11:24 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Seraj Alijan <seraj.alijan@sondrel.com>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH v2] dmaengine: dmatest: fix race between wait for thread and thread start
Date: Fri, 28 Aug 2026 18:10:24 +0300
Message-ID: <20260828151024.2081478-1-cosmin-gabriel.tanislav.xa@renesas.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PEPF00005621:EE_|TYCPR01MB11621:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: fb3fc89a-0f05-4dd4-1496-08df0516a198
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|23010399003|376014|36860700016|18002099003|56012099006|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	2wxmhUwMdy7tyCcxylGYjfHikLHSuJMTqb8ajVwPQ8+ajupRWu1a4SgTpn0kaee5U+91mLaI48/WctK66vtz2sN/iZ4u3FKJWrvszHo88dIejVc8HHMrs8zPvavDNo3k0LL0slJUiE1/ZaQGj6TfUI36p52zUErWtDZ/X8zSAP7Ksrtsl1KNuMP9ykbNdXtEpssHNKtxcpTMLd6R2TChC2hTJ4xOOCPBqX7M0c/7dOfRgyC2wr+beRX2ouxLVlceQKqa+DNQ/orYe602wykQlMKpsYqKPacy3B1B0ZDSzRaKtLBRyX04IeGIzl1EHU2ut+bahoGpKmSpOXDifqfry4loC4w+7N+PMEfqFDLvAuz2TKqcmyYfrKDOGdxDRCyoW2XoFVFzueUF2iu3RtTDQJhM/5+Y278escXxJE0zSX4eJvayb57k6mGjkg50vH57YOpaV85EP6FiuzC57NuVbRuwlRI9iSFybEMZs4TAiDUPYrttblvu7h60BuH33RpmO9kpoMen1Bg19Ldru1uBfty6h5OWiFDdy0nSKaqQGCs/conbNaCKWYCtqgfNmzetk1EpCKLM4lbAJSBOOvDhxB1GedWHoWsBCG1eFOzbFuaLyZnxGiEnnR4b/8nl3+ls0zwYv1F3KY2AARrq4CzDUTmj0ln9F7espBlT5bs4c7/njnS6mldzi8HK/NWQRDauiwlA1hjFxesHqb3RRJlUmw==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(23010399003)(376014)(36860700016)(18002099003)(56012099006)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	yTj0UjdhPVOXoMR1fXjSLexDLc4v5DO3xI+qiDUDHwjmLZpvCG644QYHA+kgU0eSHNeOsSfoMea2lz9kiKOqNNfPjhUXTwAcBQ792Y4H2OASN2cd5DE58rxq8/DQWC4P8TYfIKRC++Wf6MvB6ITzSs8m3NHBZSNFHqRQVesDVv0/Q0fds+/PcMzlJoRLnXKkgZCsJvgjARpSK3vRciPHKLZAUssQpBzQ6+1NtsLMFPY1DPhrQ2AWjA1WhtyhOZ7snd/zDolPT3cUneUG/cfabJh88ZeWNcLq6zvSqDQK4dAw3ECjC6qK8G1XKHHOIawUa4ErcPEpjl/yQUbcB2dB7sqFRdJhWBQcN05gwcp3iDZN3tNcwWz7Qr9FW+TqupOrx+k06Z9R8iDseeY6HsBv3rgq4A0JECr0wPEEUGiJlDyiCLHJj3vVmZ8prIbQT4vI
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2026 15:11:26.7915
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3fc89a-0f05-4dd4-1496-08df0516a198
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005621.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB11621

Each dmatest worker thread has a pending and a done flag which describe
the thread's lifecycle.

pending is initialized to true when the thread is added to the threads
list. pending is set to false once the thread is actually running. done
is set to true once the thread has finished its testing.

When the wait module parameter is set to true, dmatest_init() waits for
the !is_threaded_test_run() condition to become true.

If the worker thread is not started and running by the time
dmatest_init() waits, the !is_threaded_test_run() condition will be true
and the wait will stop early, before the worker thread is even started.
dmatest_init() exits, defeating the whole purpose of the wait.

If then we try to remove the module, kthread_stop() will try to cleanup
the worker threads, interrupting wait_event_freezable_timeout(), which
will return -ERESTARTSYS, causing the "test timed out" message to be
printed.

Clear the pending flag once we wake up the worker thread to avoid this
race.

Fixes: d53513d5dc28 ("dmaengine: dmatest: Add support for multi channel testing")
Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
---

V2:
 * move pending = false before wake_up_process() as suggested by Sashiko

 drivers/dma/dmatest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 2ae3469397f3..f654a00e0040 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -610,7 +610,6 @@ static int dmatest_func(void *data)
 	ret = -ENOMEM;
 
 	smp_rmb();
-	thread->pending = false;
 	info = thread->info;
 	params = &info->params;
 	chan = thread->chan;
@@ -1141,6 +1140,7 @@ static void run_pending_tests(struct dmatest_info *info)
 
 		thread_count = 0;
 		list_for_each_entry(thread, &dtc->threads, node) {
+			thread->pending = false;
 			wake_up_process(thread->task);
 			thread_count++;
 		}
-- 
2.55.0
