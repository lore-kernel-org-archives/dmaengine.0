Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2AF37AA72;
	Mon,  8 Jun 2026 12:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780920788; cv=none; b=t9vCQBl3fND35oKyXZPp1iRoQVJxPa51HCEy7SmQOGxm0nUtw6VRjPWl2dMTTgunegW3+nwDfoxN+bBn/fqKOar8RKe6lVxRaH9o1QZamszENTZS5WzONSLi4XCK1minY/044ZriLPtf5EOwsReF9KaERegXOdF1Of8U2gnAQDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780920788; c=relaxed/simple;
	bh=hsJi+KS2XVtMGlCbsVtz1AT/uQlNpSSvA7xXtDi/H30=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=fYkxkIvyvbAB5Q9Jd+rL1X4KnUNO/a+HxX56dtW3Fe6NiOCD76Mu3gkr8eXe4BB5JqS19i0Pygdb5QXAli9My7G8v18MeSfxgw/sNfDMrRAxJrnK4rMixULHUNkZfKuoi7Ci8St1pk7ShoXzT4gXkE+03mN3vieVX6sk9wvtZkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P7qzCvmI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P7qzCvmI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F9201F00893;
	Mon,  8 Jun 2026 12:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780920787;
	bh=E08OqyCxAxGzBDmJwEbAhrZ40quz2CEQKMoD/2SQDmo=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P7qzCvmIJ0RSU3Foa3MWj3ZyonEKFqYtRHVZNMqngQJjqDFvDSEbI1kDQRZnOtH2j
	 0VAvkgcK/TkLfgAIu+0WQ9qDPMxK38usQw4ZZr83+lOnxp1aSpPAsaoQ0cK7lKv8mW
	 vqX89Jv8LJuepG1l4aqARp99/j54k3iTnZKnCEMkgbsK2PxdY1HjC1JFFAHGHBuMlG
	 JKQu6r0anBTER8Ra9Ongwa2mMZeegK93zPGFLh+DWWVO9ABcXGkKxm6vEvm5zdvlCr
	 QgoK27NMMZKRQIYJIyp7mqCaoaxT59WXvOHWdBkiDYpPMe6900lzv2ZNDV0sZapkaB
	 LQlap7LsVkJ8A==
From: Vinod Koul <vkoul@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Frank Li <Frank.Li@kernel.org>, dmaengine@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <c3830cb95b0bb939f9cc9543dfa3047e41532c47.1779976024.git.ukleinek@kernel.org>
References: <c3830cb95b0bb939f9cc9543dfa3047e41532c47.1779976024.git.ukleinek@kernel.org>
Subject: Re: [PATCH v1] dmaengine: cirrus: Drop left-over from platform
 probing
Message-Id: <178092078586.96550.5783440242977246353.b4-ty@kernel.org>
Date: Mon, 08 Jun 2026 17:43:05 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.13.0


On Thu, 28 May 2026 15:50:10 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> Since commit 2e7f55ce4302 ("dmaengine: cirrus: Convert to DT for Cirrus
> EP93xx") the driver cannot probe devices using the traditional platform
> device way any more. Thus the driver's .id_table serves no purpose any
> more and can be dropped.
> 
> 

Applied, thanks!

[1/1] dmaengine: cirrus: Drop left-over from platform probing
      commit: 1d736d76c7d16359bae042b8c9fbb0fdac158721

Best regards,
-- 
~Vinod


