Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751385;
	b=bdBHOGLN+Dn9kBH3PfJYhoHYrGSUrGdOSspSMkJm339f3nmeMUhu6E1m6VKbQmiB7KCG
	 p3RZyBjGue9j0FoGRlt5sVbhJ4hdIgPVRPEd9v/6tUdqFyNi1QoR9AGVxkRu56r0uvW/d
	 /m4t1xhmSnUmHPZX5+yPVi8DXmyv2a8aNvTckLVgDyr45537bbgubDqNgbzgySOZkoSWb
	 30OXkcx6y6LpGBkF/j+889ddXf70DZzQgl8oJZoEgzYlmHbDq19CxqAXHKuw2c2KYBKuy
	 Sz68NGAPXD7AYRCFHjoSKAJS/vaqae5ts26PHD+wyuMc6a8gHhRa08nDRyOHfqcRmCQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751385;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=/z72PDBQHPTn20R5Pz7dhIXCVCpvt+QFskeQL9pZWQI=;
	b=ALQdQ2xI+ccmcWA9y9RYLnvRemSGjGyoHxNg4Ih4gta+SZBglRMPWgH1RQJucosNV2lC
	 A0VeRL4Mr8qWarquNapCO7DRhXmGXz9qw55LOWQcuq+o7Q5IX9b9zuoy/u0e4qFrihp3d
	 UuLIBqcu8ve/5bCEkRvYx6NybnBg3Nkc8Y4nTdXkZWEv3PNam5g+07z8ujz+nouppKc6v
	 8B6WHnpkklrSmsBE3gY1m/adO7V/CJu2CVOAO2GhZEmVB7Y7UkcPvYMpgVXyDSzNLL90z
	 8rBDgkacAsXSREB33ockExtry/WAjHbD0Ie5dQZfQN/B2zymkcoZTK1Roe5FK8Dg7uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=FYltU1W9;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=03WYD8pt;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C0F606A336;
	Sun, 15 Nov 2026 14:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1C0F606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=FYltU1W9;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=03WYD8pt
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794751365; bh=/z72PDBQHPTn20R5Pz7dhIX
	CVCpvt+QFskeQL9pZWQI=; b=FYltU1W99aaiIVqXGi6AG50wbWm1yb0hGd/fmuyVCNqYzwpx/y
	AE8tGSWepELo9lbyPXrOoQWvK9bU8xe+LspoWSNRE6mP9h0IjdIYZYfohZ0jhLaZeeo4/Ld8pLL
	LASB3I0wxaMaJP5l8/Pbr3kMomLQmsuDcIT1y043p1KqvldFxhSQmzGrGvBkVhBzmo++On/n0+y
	zcgpSeJoVc+kPxkHyUmo1ClMGHisK9k2zb3Ex7FDb1EiVEmI+zc26oMkfPepBABfH7yV6/l4k4S
	PLo/rHk/Y63zAmNZZC5R+ZrKgIl9fs8Y1wlt/2jIVj5y9dPYPN1O7O2G1VsiuWSEAxg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794751365; bh=/z72PDBQHPTn20R5Pz7dhIX
	CVCpvt+QFskeQL9pZWQI=; b=03WYD8ptlTiytdN5ajFiiP5+Pm+DRvwIyBrYrP8B/A2SkTO9f9
	dAmzHHHOjWBa1EPVKn+svz3CDgfYgKpb1qDw==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sun, 15 Nov 2026 17:02:44 +0300
Subject: [PATCH 2/3] dmaengine: Add support for immediate commands in the
 client API
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Post: <mailto:dmaengine@vger.kernel.org>
List-Help: <mailto:dmaengine+help@vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
List-Owner: <mailto:dmaengine+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261115-qcom-bam-dma-immediate-v1-2-9a0df4ca3be1@mainlining.org>
References: <20261115-qcom-bam-dma-immediate-v1-0-9a0df4ca3be1@mainlining.org>
In-Reply-To: <20261115-qcom-bam-dma-immediate-v1-0-9a0df4ca3be1@mainlining.org>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: dmaengine@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Nickolay Goppen <setotau@mainlining.org>, 
 Sireesh Kodali <sireeshkodali1@gmail.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794751364; l=1226;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=mjgJPApJYUAAnM21do+VQkPj7/b8PfvhGVI5TdPsNLk=;
 b=A4485McFdF68wda0RLsdW7xc44J6zRCRmeJ2OQCzCWD5nzOxC8UB4BPVTiMfYeDiONrQJPDSB
 rwVoXWn986FBVCt0q47hpQbt3Rah4sUS4DgJu3NOoSzh/gKDpJ8xpV0
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

From: Sireesh Kodali <sireeshkodali1@gmail.com>

Immediate commands are needed by the IPA network driver, so that it can
send commands via BAM to the IPA microcontroller.

Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 include/linux/dmaengine.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/linux/dmaengine.h b/include/linux/dmaengine.h
index 805668fbe437..56c49254ed04 100644
--- a/include/linux/dmaengine.h
+++ b/include/linux/dmaengine.h
@@ -200,6 +200,9 @@ struct dma_vec {
  *  transaction is marked with DMA_PREP_REPEAT will cause the new transaction
  *  to never be processed and stay in the issued queue forever. The flag is
  *  ignored if the previous transaction is not a repeated transaction.
+ *  @DMA_PREP_IMM_CMD: tell the driver that the data passed to the DMA API is
+ *  immediate command data and the descriptor should be in a different format
+ *  from the normal data and descriptor
  */
 enum dma_ctrl_flags {
 	DMA_PREP_INTERRUPT = (1 << 0),
@@ -212,6 +215,7 @@ enum dma_ctrl_flags {
 	DMA_PREP_CMD = (1 << 7),
 	DMA_PREP_REPEAT = (1 << 8),
 	DMA_PREP_LOAD_EOT = (1 << 9),
+	DMA_PREP_IMM_CMD = (1 << 10),
 };
 
 /**

-- 
2.56.1
