Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C615F4D797E;
	Mon,  5 Oct 2026 15:43:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791215015; cv=none; b=Q++RJgpt/td3wyBUuU5TmGKgSriN0ofSBL6zkky605F0ZiyvZTFQEXw6h0iumhJRn89/KcIHX52BtY8zAnXp6ohRGJRVYcyCNkivp/SEIP4VA/09OP9Jh6kGn87Gs2mL0evg4Be2EwLMOdCg62tjSmdQ0clHdyU5gJvxA1nus/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791215015; c=relaxed/simple;
	bh=UEHCB+vcXabfKFrgQQCTSyjZ7YssrJC+DEXWNAci9Do=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=t39/ZRI/y2+h1StSRXq0ugbnP8xiA3Ng2Bx6oAvccYPpOiQAwPhJexV5yEyqSlJBDMEH7yFWdbTbdznvydNNb9Enb2U8wjiHos+TJA7tW7+76z0ILJIkPzI/68fBhugytKAvVe++WLfOjKjHeBSy6+G6ETkQeh8hCg03/TP3mFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IKEg8UYN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IKEg8UYN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1733D1F00893;
	Mon,  5 Oct 2026 15:43:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791215013;
	bh=J/iPRDYAUzzcv4iTLkVceLRQFuUqyowwh8+10C3a5j0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=IKEg8UYN7Hu/x0GkasmMz9r93qPh4XMnIm0zO9hHw1RVkKO38KtT/1IagOr+L8IJd
	 QxyUu+hU/hFKlysxXg3wlraaQDv3qHdwbdExGnqb9jYpqI4UcwTwpkOmkrz76mn3hr
	 izfnOuYlMjWSRrPIRE3KVjciCGgMJ/XiE6juiJkxf3RaVi5VoyrE+/8urc5MrWtFmW
	 UWgVU/4nYAMbjojCVuWVxdry105GVc4q2qbLeJkI+QfRENrhB816ozuXdX+0PjjaoG
	 lI7L2wydqAg+/UEQbAjrc6aL1n5xPu5nwX1tGkb+mQEGz/7QIXdMFIUlosttsjLVyz
	 832sOloLeZYQw==
From: Vinod Koul <vkoul@kernel.org>
To: Frank Li <Frank.Li@kernel.org>, Linus Walleij <linusw@kernel.org>
Cc: dmaengine@vger.kernel.org, phone-devel@vger.kernel.org, 
 Frank Li <Frank.Li@nxp.com>, Frank Li <Frank.li@oss.nxp.com>, 
 sashiko-bot@kernel.org
In-Reply-To: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
References: <20260927-dma40-fixes-v7-0-89f595e8851d@kernel.org>
Subject: Re: [PATCH v7 00/24] dmaengine: ste_dma40: Fix numerous
 accumulated bugs
Message-Id: <179121501182.358863.16928802580012267725.b4-ty@kernel.org>
Date: Mon, 05 Oct 2026 17:43:31 +0200
Precedence: bulk
X-Mailing-List: dmaengine@vger.kernel.org
List-Id: <dmaengine.vger.kernel.org>
List-Subscribe: <mailto:dmaengine+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:dmaengine+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3


On Sun, 27 Sep 2026 11:03:13 +0200, Linus Walleij wrote:
> This series fixes many DMA40 bugs.
> 
> Roughly half were found while reviewing the Ux500 LCLA SRAM
> power-domain conversion.
> 
> The cyclic transfer residue bug was exposed by Ux500 audio playback.
> 
> [...]

Applied, thanks!

[01/24] dmaengine: ste_dma40: Fix physical cyclic capability
        commit: 11101a8e3e42273a5910a149f6324040b88f4747
[02/24] dmaengine: ste_dma40: Fix cyclic transfer residue
        commit: c80edceff29ee212987c2d2c851b2cb2eb4b477a
[03/24] dmaengine: ste_dma40: Recover coalesced cyclic callbacks
        commit: db28400d92cd97005065dad230b8a5d72ab121cb
[04/24] dmaengine: ste_dma40: Fix failed start cleanup
        commit: 8175ead5727173d4b96d1e830e696765d75ade71
[05/24] dmaengine: ste_dma40: Fix probe runtime PM disable
        commit: c6809b381e34f8966cc3d9e5d7d658775a408f83
[06/24] dmaengine: ste_dma40: Check runtime PM in IRQ
        commit: 12787e3f2f93f3af59769b08ee4fcb044531120b
[07/24] dmaengine: ste_dma40: Handle runtime PM resume errors
        commit: 55a35231b8ced2250a7743ec350a9566d553780e
[08/24] dmaengine: ste_dma40: Return IRQ_NONE when no interrupt is pending
        commit: b96967644c524d34b2fdd2e58c31e7b36e3469e6
[09/24] dmaengine: ste_dma40: Init hardware before registration
        commit: ffd583a734dc4bdafb9e18d9aa48b6efafd1a628
[10/24] dmaengine: ste_dma40: Fix probe IRQ leak
        commit: 7ca608cf6b842685bbbe131d4f7d638f7cdc2b5d
[11/24] dmaengine: ste_dma40: Fix DMA registration unwind
        commit: f71ef686f913c8e9771a54466a76d653b83cd3dd
[12/24] dmaengine: ste_dma40: Fix LCLA allocation order
        commit: 7d4dc355c574d414d2402ac481a2fc4ee51e2771
[13/24] dmaengine: ste_dma40: Fix probe LCLA free
        commit: 750dfcdb7a406bdd52d604099a631bbe96ddda91
[14/24] dmaengine: ste_dma40: Put the LCPA SRAM node
        commit: 9a3762b470421658214baeb6cce3eed7344bb435
[15/24] dmaengine: ste_dma40: Fix memcpy channel parsing
        commit: f2baf04a695de4f952513cb00ccf0338c6db2e00
[16/24] dmaengine: ste_dma40: Validate disabled channel indexes
        commit: c96e9f056095825b5f8d4a11f4107fc174892f92
[17/24] dmaengine: ste_dma40: Validate DMA specifier length
        commit: 9f1064ebe17cf3ab65ac6eb166398e02678aea33
[18/24] dmaengine: ste_dma40: Reject direction changes after allocation
        commit: 77ebc64f40717b8501793b5f5ee717a141e62e8e
[19/24] dmaengine: ste_dma40: Fix logical channel bounds check
        commit: 57938e0c2a24f9f792fe9f611391ef6b58d1aa21
[20/24] dmaengine: ste_dma40: Fix event group bounds
        commit: e66a9dbe04c71249cfb2a544c9c25d1b3b761fba
[21/24] dmaengine: ste_dma40: Fix V4B event group mapping
        commit: b36f8fce7314fed53563c60e683ff86deb8a51ae
[22/24] dmaengine: ste_dma40: Search all blocks for fixed logical channels
        (no commit info)
[23/24] dmaengine: ste_dma40: Validate fixed physical channel indexes
        commit: 884e01160bc727509b4fdf04e763a86b936df464
[24/24] dmaengine: ste_dma40: Validate memcpy configuration
        commit: 0ac4a90c4805b41013044fdefff051ae59a54302

Best regards,
-- 
~Vinod


