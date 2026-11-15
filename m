Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=5.75.144.95
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794751394;
	b=x6QsDD6jakPWQLsfer+N3vNc02Vc9faPSm5aE+UpFfytsegjQrPnwC1BWBJyQtgVgqmI
	 OngZPmNjZ35g4818uI6R1QASQK9dqHgy0fpjKt6VbNgg9uOKReqO9DlRd3IoW3z5nzRLe
	 4531SZE+9ENj84XfyU1xCN/ehNKz7LQ+jAPKknh7K8yXjiVqfGhwKpGLjQoot2ovSyXVn
	 bO7NNjNvBwn3ddoLFxQ+CfUsXf57pEVAlekAxMb2Dh88hASNKhqTzVQ7uK4034syPuZFk
	 0KL/HU+vWopCLCUiowSC1cQj5eqnubbjtBklxGCXF1GbZNMXs1T/9OI+0wkU08Q6iAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794751394;
	h=DMARC-Filter:DKIM-Signature:DKIM-Signature:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:
	 X-Developer-Key;
	bh=D55uc7wACBXyQwdQdlW/zL8lr0CzFfY3xQsuHVop1lY=;
	b=ixbdNRA+QBXpxKeTo2VsPJQ3P2NjEUeMVtzhWStYuHhbBVfk6JNn4zQzOBB7df2G6aPm
	 m8xH33W+paLA5erXfjIidkF3iQ6SEmgsXQMAIz+YVyKtRACKwRpyogzB7fmokZmkG8Niy
	 HT15Fs7zkUtA+zETNbLOF7m8YlPB7Am4Rnc9qm/4dyyUssWwVtERJ0+i0tseviV61CGhW
	 W29ugEZNDaBMAn70CsuRl3ECna4ZZU2gotfeDoXAmy+I8QATlEoMI3Fh3h8fUBFT99tW2
	 qVEcE65GSOSyUWllB/FxMLrwdYm5v03lrL8PETCGCf4M0vyfXpyozcRXiShmChlTHuQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=mainlining.org;
	spf=pass smtp.mailfrom=mainlining.org;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=H0YOHiWd;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=7iRKhdmy;
	arc=none smtp.remote-ip=5.75.144.95
Received: from mail.mainlining.org (mail.mainlining.org [5.75.144.95])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6180A606A336;
	Sun, 15 Nov 2026 14:03:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6180A606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mainlining.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mainlining.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mainlining.org header.i=@mainlining.org header.a=rsa-sha256 header.s=202507r header.b=H0YOHiWd;
	dkim=pass header.d=mainlining.org header.i=@mainlining.org header.a=ed25519-sha256 header.s=202507e header.b=7iRKhdmy
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794751365; bh=D55uc7wACBXyQwdQdlW/zL8
	lr0CzFfY3xQsuHVop1lY=; b=H0YOHiWdPqTI257r3hZ3lyn/Q8daCLkgfFotN35eH0jP27djph
	B02QPtuJURtEtuZ8O211jKAb44ZcYlSa3kaDJN3W0gWYtIEFIsBZaHlSDLaU72GvkXmOlHtVE+V
	DbsGvEwDvDpMtZl95QjSiYAYIT3hdiovDvap3hMS3gPCwDf1BnLGKxdB+mww6AnYkn5iZ+IxFs8
	EekNTMI8WjYMwZdONf6rLElSXY/faWLdLJj+A0C3Ob5S7KCbicetuFzNXwtGoXPI36pbZzzO4sK
	6HwFNngokScojqE7peNieu0pOu1UXLXb8NSXw7ILBNxx+w2iltvNU06KnF5gasTKUWw==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=To:Message-Id:Subject:Date:From; t=1794751365; bh=D55uc7wACBXyQwdQdlW/zL8
	lr0CzFfY3xQsuHVop1lY=; b=7iRKhdmyTm+QmRZWIK42Gv6NxT89bXqE07x2YtnOKXqZUeAx2F
	3z5kqmZh0krvzAA+5h66JK32gBD0+L9HjDBQ==;
From: Nickolay Goppen <setotau@mainlining.org>
Date: Sun, 15 Nov 2026 17:02:43 +0300
Subject: [PATCH 1/3] doc: dmaengine: client-api: Add immediate commands in
 the DMA client API
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
Message-Id: <20261115-qcom-bam-dma-immediate-v1-1-9a0df4ca3be1@mainlining.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794751364; l=1294;
 i=setotau@mainlining.org; s=20250815; h=from:subject:message-id;
 bh=948fIJaUscWpzi1ueLKn6u84SETgPAPB5bo1mW/0LWM=;
 b=uUCLZUgbeEIgX5Kl5uqAlluOozDrf0SuxPAtUH9HakGZ+d1h9WIHa+zrSbnfbChEKOUJwIgTu
 CKZ14b8sHflDJsT0MPl9iSuHM9L103QwWfEgPG4dgwm6PathFslYvjK
X-Developer-Key: i=setotau@mainlining.org; a=ed25519;
 pk=Og7YO6LfW+M2QfcJfjaUaXc8oOr5zoK8+4AtX5ICr4o=

From: Sireesh Kodali <sireeshkodali1@gmail.com>

Immediate commands are used by the IPA driver to send commands to the
microcontroller over BAM. These are different from PREP_CMD.

Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>
Signed-off-by: Nickolay Goppen <setotau@mainlining.org>
---
 Documentation/driver-api/dmaengine/provider.rst | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/driver-api/dmaengine/provider.rst b/Documentation/driver-api/dmaengine/provider.rst
index be47852e5a0f..05911c03558d 100644
--- a/Documentation/driver-api/dmaengine/provider.rst
+++ b/Documentation/driver-api/dmaengine/provider.rst
@@ -612,6 +612,16 @@ DMA_CTRL_REUSE
     writes for which the descriptor should be in different format from
     normal data descriptors.
 
+- DMA_PREP_IMM_CMD
+
+  - If set, the client driver tells DMA controller that passed data in DMA
+    API is immediate command data.
+
+  - Interpretation of command data is DMA controller specific. It can be
+    used for issuing immediate commands to other peripherals/register
+    reads/register writes for which the descriptor should be in a
+    different format from normal data descriptors.
+
 - DMA_PREP_REPEAT
 
   - If set, the transfer will be automatically repeated when it ends until a

-- 
2.56.1
