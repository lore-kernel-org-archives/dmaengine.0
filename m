Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 759803CE4BD;
	Wed, 18 Mar 2026 11:27:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773833265; cv=none; b=gk9b+B/G88u+DGLe3Jjo7TXdbM+JWTsGqhX2plE+FA6k2JvE4rxUBN4Z+PBk2HwOeOW4QmIaaRhbPXEf23livNsiirEF30y7cnJqV5FCAVcxUe1SLdf4ZJvs9ZJ+CMlGNuGrEW/IqigCIBe1EyVisZTeyTgDNFtfvsq2rlpnb80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773833265; c=relaxed/simple;
	bh=SddV8voIsEFuPxT+7XHbOrlR4AELF1Ovx3gw0rTnECU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=GXu6aY45Dz0h/2WLWgitG/P05Hyy/cgbMlHThYrc5ZExCF55rnOeZPkfh29SDQpJrIH6VsTVzdBbiRbQSIbuskEnvWovdfHFMEeI89bEOOtHd2TeWhgmBIHMg3o68eRpNHvHpTQVAxUtnINQF+WVrxpQfHbTd1wUbOoSLkkYPH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EgMOhB8W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EgMOhB8W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F535C2BC87;
	Wed, 18 Mar 2026 11:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773833265;
	bh=SddV8voIsEFuPxT+7XHbOrlR4AELF1Ovx3gw0rTnECU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=EgMOhB8WaJZ5IgdtmhBgdOnjUzRkb+/YCC7J96ub2HhBSd1GOVD2/hxJAgjNMN/nf
	 CHIEbxDymVfjgA0aC0YCmOnWv60cWVQaYWSK/icxjCX6E0hzVsy3IIENxPRh5+PhhZ
	 hoVS2zmGfc4i/yPg+5hiUpZ9iOGLAgFLLmyT4cl4YIOf9CcxzPeR+yIWJ105NtW0JL
	 vAnNxnKYdRqgO+BKwcn2xBDskKxTqNL7hc9zFsM81H/X4TzNma1or1Z9vyLD3OHLr0
	 3qAXHX/eLksGUSna4X7K+pRgs5qsFWP4+tChBrYsoUypPF09GGc58YKSf6GeDb2xKi
	 2+JmHXYxHu9ng==
From: Vinod Koul <vkoul@kernel.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, dmaengine@vger.kernel.org, 
 devicetree@vger.kernel.org, Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260317204938.120729-1-colin.i.king@gmail.com>
References: <20260317204938.120729-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] dt-bindings: dmaengine: Fix spelling mistake
 "Looongson" -> "Looogson"
Message-Id: <177383326202.408483.13593288650783586231.b4-ty@kernel.org>
Date: Wed, 18 Mar 2026 16:57:42 +0530
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13.0


On Tue, 17 Mar 2026 20:49:38 +0000, Colin Ian King wrote:
> There is a spelling mistake in the title field. Fix it.
> 
> 

Applied, thanks!

[1/1] dt-bindings: dmaengine: Fix spelling mistake "Looongson" -> "Looogson"
      commit: 132e47b783a8057a8eb14484f153b417de00c1cb

Best regards,
-- 
~Vinod


