Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795168858;
	b=fDBmTcIXP7RS3C7IV932AeVoYr7mA17XJ85eYSXTmzUJtz5dMTZ5ypNQ7dhxQBmtDRIU
	 Z4iLa+9vh6W/oUhirsmwnJKrG50yLn/EBqTKfEtzJlVdnokiUJxZ3Tku5GC8XTrbvME+u
	 ftNmKyuaI4C7KIeuvzFKlSK0CR2ujEFL3lnyl0kORhef09FvGwE0SIkb+VBgdaxymEted
	 5FD8O3ZJuQLNA1kWqhk7554OgiwBfIbzrSiE21hfnvMTajTQYjlPXhAsQCeaV6s1Syr81
	 xJbMUeHsxIh1Tm3BkOJi/PH4gFCwTOYI5Owk6m0iz+T8xww0vKRveOnQ800iOaG3Gqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168858;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer;
	bh=5/GWWF39b0UG/gg32Ki3MJFclUxQuCyhKJHt8MgDaIA=;
	b=T4hWKlStGHJbFiuNxnQCTLeTdmwsW3S1AcBtygHKbIsQGw/eQzW+F9K9FGTuinHTLP0i
	 TEszc09nfIZJ8uYN5FTqDWSQ41k7npA9E4erx/DGN555YKNX8fm+MW4AQ7SL7LVQiw+by
	 aCNRPHt4YEnB0DvvAiXtLuTtCFth4muK6/DHMtEIDOUMiy9BY0zAOZBcqKII5Vt2w8Zxj
	 yx0bs+sQ1JdM70ekdr2SI+j9rF9SxOQ6A+S+r9xEP5V/iiHOo0WXL1Yhh1BQOGJ6E4pwB
	 O6o2glMFBvnGX2/FWjL4Gq376lSrQ2cZA+t78KTlGbbQg18qZCPZYHCyANloLz+EAWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RmNX3PQl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EC43606A330;
	Fri, 20 Nov 2026 10:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RmNX3PQl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A50BE1F000D0;
	Fri, 20 Nov 2026 10:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795168857;
	bh=5/GWWF39b0UG/gg32Ki3MJFclUxQuCyhKJHt8MgDaIA=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=RmNX3PQlxdDJsVIrIf2QipU48ERpvXwjyMDEEm5gyHtSBPzsstBUBnicVNLqa6oLX
	 RevLkQQ/988mRhGjKPWJzs3jXBHpU1VoSffrI5d4fl9K3DqDujCOeEqrtjazj8MV6d
	 K/3AwBkJVLWCxzYNbqrg0/BZUKrcmFE+sCJaZgVPW31UQwu8OtEZ6aXE4tONeHMN//
	 /n3VNqJ+EOsrJdhiNWybFsrS0MNxq7kzjDJx28L8wpQHs2JaR10j+l+LahqrVXFoYu
	 3/hMzbc07AI1WQbnKZI84Lka/EuWakrNbMENCaQlZ+6Dr31cv4WKNbBbD3veOWrjYL
	 z9jzdc4ANLsfg==
From: Vinod Koul <vkoul@kernel.org>
To: dmaengine@vger.kernel.org, Rosen Penev <rosenp@gmail.com>
Cc: Frank Li <Frank.Li@kernel.org>, linux-kernel@vger.kernel.org
In-Reply-To: <20260915180919.8899-1-rosenp@gmail.com>
References: <20260915180919.8899-1-rosenp@gmail.com>
Subject: Re: [PATCH] dmaengine: bestcomm: drop unneeded sram exports
Message-Id: <179516885631.45276.10010375432650136083.b4-ty@kernel.org>
Date: Fri, 20 Nov 2026 15:30:56 +0530
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
X-Mailer: b4 0.14.3


On Tue, 15 Sep 2026 11:09:19 -0700, Rosen Penev wrote:
> bcom_sram_init(), bcom_sram_cleanup(), bcom_sram_alloc() and
> bcom_sram_free() are only called from bestcomm.c, which is part of
> the same bestcomm-core module as sram.c.  Remove the now-pointless
> EXPORT_SYMBOL_GPL() statements; the functions stay non-static because
> they cross compilation units within the module.  bcom_sram itself
> remains exported for the inline helpers in sram.h.
> 
> [...]

Applied, thanks!

[1/1] dmaengine: bestcomm: drop unneeded sram exports
      commit: 4dbb746bb236b2da90549f0e3240e3da2c50022c

Best regards,
-- 
~Vinod


