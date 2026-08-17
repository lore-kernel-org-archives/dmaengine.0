Received: from TY3P286CU002.outbound.protection.outlook.com (mail-japaneastazon11010050.outbound.protection.outlook.com [52.101.229.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D5D361DDA;
	Mon, 17 Aug 2026 19:27:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.229.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786994827; cv=fail; b=qH8tu2cDWtteswiR+TlLljL6ARrgQ/buq/ApHat5wKGJa8mafm/txRr4SjHB6bFg4sZ7NQp8VUDDIC1DBTSW4ZDpL4wlTNggIc+t09j1K948UfiSCmJDY5G9MoqLKBPhnHEkuhusRV4qIU4Ayx4eMIQm0ayjUadUt79NO98CItg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786994827; c=relaxed/simple;
	bh=bQLoOkG6/kb5nppf/o0cqtha9mqskPL1NHKPCLYfw5U=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=OUSV594NLMVETPNa344CE+ZEYbnJLkVNOb4lun6liDnyKCIFCiUKJ8GoXSEyMlRFQFG4LtsvTjPDh7CDXOxPZevUDATL6uO4uVZx9G8vGHxa5AGT0A60iE6Z4OZGxDQKw4XJfD6Xo/smzTig02xo27r9n/tz5InpmepANIv0mdE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com; spf=pass smtp.mailfrom=renesas.com; dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b=H7nLFQ37; arc=fail smtp.client-ip=52.101.229.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=renesas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=renesas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=renesas.com header.i=@renesas.com header.b="H7nLFQ37"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=siwJN6yjqtVkFyGdyZiuLoD78u8WMTfeV/V2kTC8sS/vGkAbEGwUxBeD//C1p6lgHmquK/y0tVZOwbFC6MziAYNxI9/BkvuzUiAZSuI3xXiDvOA3VIx1pYaomvkFmFdf/uoSNHKESQDMYqXPjk95eQkeNpbdi1HOxgS7YqaZvTz0NzsbK6krdDKrv5e5wqwn7u+iNpIIW74VOKg9RzJ3rvfe5SPjCqVzoTBc9oE2RDCf5hBGe0F6vy58skffTVNFmokaTjWLN7KzBF4kVso6t8QDQrGXxIDELambweDr/ns7YqGyxIvrOdq0gS8W/wz1YguSoUPqzSpfEY2YT1U3xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=onnCGfE8YeY/ZugOW0+bU0KR4nh++YqTh+ithcf0bYI=;
 b=ioh4qb7+uDppaTKs3o8wMWHYz1I51Ko/MOE8sUZmwBSzHxgBkjxB4GhSYCXODVkKI5VAzFo5J76YWLW8kV8kJ9upjSsLojnf0qGoDbO+ICWP+trrZVyjym8WYb4i8DkpFLh8tiL45df8CqM7ADZdMm/bljL0F0qjXQei5NHajS3F4A4P0PgRV6OSiHnke8msncmWErG0BlIHGdJLGuNcET83m5oyt7ELq/CuHXH/8maUtLF9lpYpZ4sVUj18D8pVIbUXPwuVcE0VnxzyvGQmhDeKZGLg1vq8j3ARlPqLlBi+ATIvbM5i8mzBn+sIsCSYHjsTGMDzeqP9HsXziKcinA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 8.62.32.50) smtp.rcpttodomain=kernel.org smtp.mailfrom=renesas.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=renesas.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=renesas.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=onnCGfE8YeY/ZugOW0+bU0KR4nh++YqTh+ithcf0bYI=;
 b=H7nLFQ37huiVuED9VedF2TQ6vdpCfnp3w2z8xJfEmq/bwzhPcKlluSAjNdCF1cHUpcFAsOWvKY91qWN15Co1CwWFdbnnak6JaMZ9tlb55QvLieCjdZRKZbGOOX8tINgKmzFm2xV7oS0v/B9gjariixMjDIap0mo5/JJXwTalv80=
Received: from TYCP301CA0019.JPNP301.PROD.OUTLOOK.COM (2603:1096:400:381::6)
 by TY4PR01MB14435.jpnprd01.prod.outlook.com (2603:1096:405:23d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.17; Mon, 17 Aug
 2026 19:26:59 +0000
Received: from TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:381:cafe::8f) by TYCP301CA0019.outlook.office365.com
 (2603:1096:400:381::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.315.17 via Frontend Transport; Mon,
 17 Aug 2026 19:26:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 8.62.32.50)
 smtp.mailfrom=renesas.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=renesas.com;
Received-SPF: Pass (protection.outlook.com: domain of renesas.com designates
 8.62.32.50 as permitted sender) receiver=protection.outlook.com;
 client-ip=8.62.32.50; helo=ejcrelay004p.adwin.renesas.com; pr=E
Received: from ejcrelay004p.adwin.renesas.com (8.62.32.50) by
 TY2PEPF00005622.mail.protection.outlook.com (10.167.240.53) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.21.339.3
 via Frontend Transport; Mon, 17 Aug 2026 19:26:59 +0000
Received: from demon-pc (DEU-5CG5050QD0.adwin.renesas.com [10.226.92.24])
	by ejcrelay004p.adwin.renesas.com (Postfix) with ESMTP id 88AE5300022C;
	Tue, 18 Aug 2026 04:26:57 +0900 (JST)
From: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
To: Vinod Koul <vkoul@kernel.org>,
	Frank Li <Frank.Li@kernel.org>,
	Seraj Alijan <seraj.alijan@sondrel.com>
Cc: dmaengine@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Subject: [PATCH] dmaengine: dmatest: fix race between wait for thread and thread start
Date: Mon, 17 Aug 2026 22:25:57 +0300
Message-ID: <20260817192557.437474-1-cosmin-gabriel.tanislav.xa@renesas.com>
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
X-MS-TrafficTypeDiagnostic: TY2PEPF00005622:EE_|TY4PR01MB14435:EE_
Content-Type: text/plain
X-MS-Office365-Filtering-Correlation-Id: 5ccc438e-1774-431d-1d6c-08defc958234
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|82310400026|1800799024|36860700016|23010399003|56012099006|18002099003|11063799006|10067099003;
X-Microsoft-Antispam-Message-Info:
	kWVVgmLhcfAsRDwOGuVYhJO2xob3AInCw2flPMhLE7ZyRwzcP7rjnLJG9MJE+G4bLROA5U120FfUcFIBPsRjfm0hV02W9zYoyM2SGdH+BjTPG3AVc8lEQ2a4dj0rbN5RAwV0zYisqxil08mUjr9RHnjrZ/XUB64svTb/OhdtWs1aDzPEo35uz19u8vf/0SbaxSVme2Q16TlUaJupIOtJRdADhhxUTrycAkQz/d95J16MbMu5lISb6QQWMyrJkNGuDB9AJMK4t3VJZo1nZzAEr8BsXphlLrf5wOj6yKgj2M5+SVyvGOYUYoTfHLEAfL7VKVtuoL/mwU8tl0BlVU1LcB8nTEgXxX9btXzli5VGexVC6H6uX5k2CIzTyOKQh3suaR/0dfDq/15YaR7N/oSZ0GQy9dqtPgMgYylZwd4jpemen4j+/gAFvPD1bCvvKfCCKkx8Svw1eyKHd4qE4cb154aq3uuP8JhgzyiC195POh5ZQoQ4lDckFLYsVnu8RlPPtqgKkcSLvuh4T5G24eFQFz5y1qPJ8Qj/JUfRB5nF+5BqePSyvcTX/5UjvGzZMPw0/34a0xtQ/+2ZC57jn/uulwt9TnyYvC371jvaFbhvl0C2YmNajs3N2vb8HPd6i4OJq+e3TpfB8lhhmEWv+gIER11hIF9K969SJUo6FOHYHLojpJBF5OX70Rd4N0Rmio5iTltDXqJax+i/1YLeW1prpQ==
X-Forefront-Antispam-Report:
	CIP:8.62.32.50;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:ejcrelay004p.adwin.renesas.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(376014)(82310400026)(1800799024)(36860700016)(23010399003)(56012099006)(18002099003)(11063799006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	TqP1GtKCiGlKDpMgy5WXoNAhSSIbwxqofHjrzICajDkoW13bUDJkoDBRu9Ubxbs1qWeK8Kx5uID+aAwOa3ZM4RGnV7mN95g4B3fGCFi0Vg2UZvoxXT8iPjKr5XEoOxg4S+JYqhsw4H57jS1dO4zG824dx5XOwNmUVv8uUvxFwnDL06xO0iJMXl2yJTIuLbhMIs/SBGOxgI9SsleIm/vYtxizRuWvoW/m8dsKhvEergiObBOuBV1Wt7AJPJHqGFha0UpbxPFJ8BMQJGB1Yzxek9f0VDbG7Sq8KXFkcemyM9CDKBOe5wQEM+F96WBTwf0L6hF2GgY08CBZ5bWy0VXREJGjgonimh8EfegHlgWgF+Yxj1o4vSJPSk6HZ2c/65HhFi13OKn9qv8lUbd6ZBUm8nWG8fEoblXwRx4ct3ZbR/sq2/oetWfwaA6KcFHJR/xm
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Aug 2026 19:26:59.7465
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ccc438e-1774-431d-1d6c-08defc958234
X-MS-Exchange-CrossTenant-Id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=53d82571-da19-47e4-9cb4-625a166a4a2a;Ip=[8.62.32.50];Helo=[ejcrelay004p.adwin.renesas.com]
X-MS-Exchange-CrossTenant-AuthSource: TY2PEPF00005622.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY4PR01MB14435

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
 drivers/dma/dmatest.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/dma/dmatest.c b/drivers/dma/dmatest.c
index 2ae3469397f3..2d2eb43eee7c 100644
--- a/drivers/dma/dmatest.c
+++ b/drivers/dma/dmatest.c
@@ -610,7 +610,6 @@ static int dmatest_func(void *data)
 	ret = -ENOMEM;
 
 	smp_rmb();
-	thread->pending = false;
 	info = thread->info;
 	params = &info->params;
 	chan = thread->chan;
@@ -1142,6 +1141,7 @@ static void run_pending_tests(struct dmatest_info *info)
 		thread_count = 0;
 		list_for_each_entry(thread, &dtc->threads, node) {
 			wake_up_process(thread->task);
+			thread->pending = false;
 			thread_count++;
 		}
 		pr_info("Started %u threads using %s\n",
-- 
2.55.0

