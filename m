Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793828746;
	b=dZiQA/ELuvM4zrlNxSDw4ZZ53D4toS71z+pKA8REhuCT6Sc3wZ6eqar31l05Pyl28rsP
	 mOhKAicZpsjWgBFUhTpKqgo/j1bVrXT2nFHLSjZTLwzpcb/9JSJiCrVPoGXCrbD9OZzll
	 cjq7dDmDRi1N27O5m3HK8jwPlcgcOIDdYn5NV2yl1u3o8F/yMFLdN81U06y1FMEBtm3XD
	 sooZkYloTyRHpAY3Oi15E54N3fyu/vIl0T0FnT7Hp/NvtTRLo73wS2shTYnoxmE1Jqm5s
	 ZysRxT8+6EfBxhHII/RTvZtw2xEQfRKKaJaSz27Lf1I4ndn3P/cH3nNnX2q+01ewgOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793828746;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=lqjLb+mG6Paw67aPWiBPzyeEWmphVu8ONgODVgCa5Sk=;
	b=qb9709oFa8W+4DKUfilw7pCZkqMeVb3KahbeQ4wP0V5B35WLxXP+FIqQx2D92rxcBDwk
	 kAWWkceOGLw8Hwrx+Z+opeXhcPPHegdHmzbjukJC/T/v8W97AC/CMJ3ayqrHQfPmlDq+5
	 RIHVXf+5BZKETT/vS3VSnX85rBk9jqvVHBIW+zUKZDhBC3buIU9ci0WDoG9iJiTGaXPBi
	 Q8HFow+CIsfg9auFyo/wNVq+LA8K7wvIfkJ4Rd8CyrOVbizPGLR87pqRb21l+upZqHl5B
	 qmkfLM9E7Dq2pLH95kQiP1QDwVQNF1emQAglPizJ7p/8ccM76LUSy8GOSmnXVsXLXMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UBxRSSwD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78916606A331;
	Wed,  4 Nov 2026 21:45:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UBxRSSwD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B5E71F000C1;
	Wed,  4 Nov 2026 21:45:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793828746;
	bh=lqjLb+mG6Paw67aPWiBPzyeEWmphVu8ONgODVgCa5Sk=;
	h=From:Date:Subject:To:Cc;
	b=UBxRSSwDd5V0GiU7DpH+nPyMq/Maum4d2vpncqrIBLDu2lUK98IphgRclwl+zGP9k
	 gEvL2g8aUyHLOmOdUwPUeK2PDLgF2NKyWbjcp/KGXE2+y7vUp9vBavjegYBHng3/Yx
	 5+a3JMKjU0kka8aXoLwIYEi3IxuGsQyNdgsVD8+JTAJJUZ8T2p5UQiP8ZXuRrRYHcS
	 pcBPL7s5D7hKET/god8/S1UMhJkew0GHil3YYHiHXepbN1w2wCo0u/OWDjLsUyvhL4
	 Az8NtbAYfIkmM+HBYZbvXPlqRTS3JJr1dLD1hngK6nKagKN57Oz6wgYgontgVzE4Mr
	 KNSv+QnjQ4c1g==
From: Eugen Hristev <ehristev@kernel.org>
Date: Wed, 04 Nov 2026 23:45:32 +0200
Subject: [PATCH] dmaengine: pl330: Bound UNTIL loop
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
Message-Id: <20261104-b4-pl330-until-v1-1-b541929da163@kernel.org>
X-B4-Tracking: v=1; b=H4sIAHun62oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDQwMT3SQT3YIcY2MD3dK8kswcXYtEIwtzSwvD1BTTFCWgpoKi1LTMCrC
 B0bEQfnFpUlZqcgnIFKXaWgAl+MUdcgAAAA==
X-Change-ID: 20261104-b4-pl330-until-8a287981ed5d
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>
Cc: dmaengine@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Eugen Hristev <ehristev@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2972; i=ehristev@kernel.org;
 h=from:subject:message-id; bh=yBmITGHz7EZUELEqDKOPgjfsBeFhSjNtZTuRzp+q7Eg=;
 b=owGbwMvMwCXWkjcnuXne3fmMp9WSGLJeL2/JcxHPTTqy95HjjaX9n8RaLFVCo9/OOVJ+pOnms
 uzojCUBHaUsDGJcDLJiiizVJv9qhft3uJ90tVSBmcPKBDKEgYtTACbi85Hhv3uF244dV2y99l+e
 1fp2c9S8601TUr90/L+novLfbMvki74M/4O1Z5hPlWg1qvdzUfkuf3adotNN77jUlRI81Qm386r
 EGQE=
X-Developer-Key: i=ehristev@kernel.org; a=openpgp;
 fpr=AB184498D27A77B65D7852C81EB31E020EAC2FC8

Bound UNTIL loop with a timeout.
It may happen that by accident pl330 will read/write a wrong address
and generate a bus fault. In such cases it will not complete the
condition that UNTIL waits for. To have the driver continue and not
hang, use a timeout.

Assisted-by: Github Copilot
Signed-off-by: Eugen Hristev <ehristev@kernel.org>
---
 drivers/dma/pl330.c | 36 ++++++++++++++++++++++++++++++------
 1 file changed, 30 insertions(+), 6 deletions(-)

diff --git a/drivers/dma/pl330.c b/drivers/dma/pl330.c
index c2d0b473b8f4..9ced60fef9ff 100644
--- a/drivers/dma/pl330.c
+++ b/drivers/dma/pl330.c
@@ -248,8 +248,15 @@ enum pl330_byteswap {
  */
 #define MCODE_BUFF_PER_REQ	256
 
-/* Use this _only_ to wait on transient states */
-#define UNTIL(t, s)	while (!(_state(t) & (s))) cpu_relax();
+/* returns true if state reached within loop budget */
+#define UNTIL(t, s, loops) \
+	({ \
+		unsigned long _l = (loops); \
+		while (!(_state(t) & (s)) && _l) { \
+			cpu_relax(); _l--; \
+		 } \
+		!!(_state(t) & (s)); \
+	 })
 
 #ifdef PL330_DEBUG_MCGEN
 static unsigned cmd_line;
@@ -979,7 +986,8 @@ static void _stop(struct pl330_thread *thrd)
 	u32 inten = readl(regs + INTEN);
 
 	if (_state(thrd) == PL330_STATE_FAULT_COMPLETING)
-		UNTIL(thrd, PL330_STATE_FAULTING | PL330_STATE_KILLING);
+		UNTIL(thrd, PL330_STATE_FAULTING | PL330_STATE_KILLING,
+		      msecs_to_loops(5));
 
 	/* Return if nothing needs to be done */
 	if (_state(thrd) == PL330_STATE_COMPLETING
@@ -1059,12 +1067,24 @@ static bool _trigger(struct pl330_thread *thrd)
 
 static bool pl330_start_thread(struct pl330_thread *thrd)
 {
+	/* msecs_to_loops(5) gives the same budget used by _until_dmac_idle */
+	const unsigned long tout = msecs_to_loops(5);
+
 	switch (_state(thrd)) {
 	case PL330_STATE_FAULT_COMPLETING:
-		UNTIL(thrd, PL330_STATE_FAULTING | PL330_STATE_KILLING);
+		if (!UNTIL(thrd, PL330_STATE_FAULTING | PL330_STATE_KILLING,
+			   tout)) {
+			dev_err(thrd->dmac->ddma.dev,
+				"pl330: thread stuck in FAULT_COMPLETING\n");
+			return false;
+		}
 
 		if (_state(thrd) == PL330_STATE_KILLING)
-			UNTIL(thrd, PL330_STATE_STOPPED)
+			if (!UNTIL(thrd, PL330_STATE_STOPPED, tout)) {
+				dev_err(thrd->dmac->ddma.dev,
+					"pl330: thread stuck KILLING->STOPPED\n");
+				return false;
+			}
 		fallthrough;
 
 	case PL330_STATE_FAULTING:
@@ -1073,7 +1093,11 @@ static bool pl330_start_thread(struct pl330_thread *thrd)
 
 	case PL330_STATE_KILLING:
 	case PL330_STATE_COMPLETING:
-		UNTIL(thrd, PL330_STATE_STOPPED)
+		if (!UNTIL(thrd, PL330_STATE_STOPPED, tout)) {
+			dev_err(thrd->dmac->ddma.dev,
+				"pl330: thread stuck, not reaching STOPPED\n");
+			return false;
+		}
 		fallthrough;
 
 	case PL330_STATE_STOPPED:

---
base-commit: 6d0933ae9d46674a6ea63a87e9e9ab4e662670c9
change-id: 20261104-b4-pl330-until-8a287981ed5d

Best regards,
--  
Eugen Hristev <ehristev@kernel.org>

