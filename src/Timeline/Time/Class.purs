module Timeline.Time.Class where

import Timeline.Time.Value (DecidedValue(..))
import Timeline.Time.Min (DecidedMin(..))
import Timeline.Time.Max (DecidedMax(..))
import Timeline.Time.Span (DecidedSpan(..))
import Timeline.Time.Bounds (DecidedBounds(..))
import Timeline.Time.Limit (DecidedLimit(..), Limit(..))
import Timeline.Time.MaybeLimit (DecidedMaybeLimit(..), MaybeLimit(..))
import Prelude

-- | A class for formatting index types as strings, to be listed
class AsSecondaryString a where
  asSecondaryString :: a -> String

instance asSecondaryStringDecidedValue :: AsSecondaryString DecidedValue where
  asSecondaryString v = case v of
    DecidedValueNumber value -> "value: " <> show value

instance asSecondaryStringDecidedMin :: AsSecondaryString DecidedMin where
  asSecondaryString m = case m of
    DecidedMinNumber { begin } -> "beginning: " <> show begin

instance asSecondaryStringDecidedMax :: AsSecondaryString DecidedMax where
  asSecondaryString m = case m of
    DecidedMaxNumber { end } -> "end: " <> show end

instance asSecondaryStringDecidedSpan :: AsSecondaryString DecidedSpan where
  asSecondaryString s = case s of
    DecidedSpanNumber { start, stop } -> "start: " <> show start <> ", stop: " <> show stop

instance asSecondaryStringDecidedBounds :: AsSecondaryString DecidedBounds where
  asSecondaryString s = case s of
    DecidedBoundsNumber { begin, end } -> "beginning: " <> show begin <> ", end: " <> show end

instance asSecondaryStringDecidedLimit :: AsSecondaryString DecidedLimit where
  asSecondaryString l = case l of
    DecidedLimitNumber l' -> case l' of
      LimitBounds { begin, end } -> "beginning: " <> show begin <> ", end: " <> show end
      LimitMin { begin } -> "beginning: " <> show begin
      LimitMax { end } -> "end: " <> show end

instance asSecondaryStringDecidedMaybeLimit :: AsSecondaryString DecidedMaybeLimit where
  asSecondaryString l = case l of
    DecidedMaybeLimitNumber l' -> case l' of
      JustLimitBounds { begin, end } -> "beginning: " <> show begin <> ", end: " <> show end
      JustLimitMin { begin } -> "beginning: " <> show begin
      JustLimitMax { end } -> "end: " <> show end
      NothingLimit -> "no bounds"